; DESCRIPTION: Renders a cyan line between points (16, 22) and (269, 160).
; PLAN: r0=16(x1), r1=22(y1), r2=269(x2), r3=160(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 22
LDI r2, 269
LDI r3, 160
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
