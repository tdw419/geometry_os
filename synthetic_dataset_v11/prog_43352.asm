; DESCRIPTION: Renders a green line between points (28, 188) and (9, 64).
; PLAN: r0=28(x1), r1=188(y1), r2=9(x2), r3=64(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 188
LDI r2, 9
LDI r3, 64
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
