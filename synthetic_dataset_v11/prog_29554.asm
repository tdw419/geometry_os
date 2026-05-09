; DESCRIPTION: Renders a cyan line between points (24, 40) and (8, 222).
; PLAN: r0=24(x1), r1=40(y1), r2=8(x2), r3=222(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 40
LDI r2, 8
LDI r3, 222
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
