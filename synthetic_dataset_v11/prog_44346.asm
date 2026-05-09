; DESCRIPTION: Renders a green line between points (255, 98) and (101, 187).
; PLAN: r0=255(x1), r1=98(y1), r2=101(x2), r3=187(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 98
LDI r2, 101
LDI r3, 187
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
