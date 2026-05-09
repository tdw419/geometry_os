; DESCRIPTION: Renders a blue line between points (183, 125) and (256, 215).
; PLAN: r0=183(x1), r1=125(y1), r2=256(x2), r3=215(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 125
LDI r2, 256
LDI r3, 215
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
