; DESCRIPTION: Renders a magenta line between points (256, 98) and (17, 64).
; PLAN: r0=256(x1), r1=98(y1), r2=17(x2), r3=64(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 98
LDI r2, 17
LDI r3, 64
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
