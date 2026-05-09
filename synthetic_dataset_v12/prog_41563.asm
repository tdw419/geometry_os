; DESCRIPTION: Renders a blue line between points (11, 205) and (1, 231).
; PLAN: r0=11(x1), r1=205(y1), r2=1(x2), r3=231(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 205
LDI r2, 1
LDI r3, 231
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
