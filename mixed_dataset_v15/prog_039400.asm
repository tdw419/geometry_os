; DESCRIPTION: Renders a green line between points (111, 185) and (236, 164).
; PLAN: r0=111(x1), r1=185(y1), r2=236(x2), r3=164(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 185
LDI r2, 236
LDI r3, 164
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
