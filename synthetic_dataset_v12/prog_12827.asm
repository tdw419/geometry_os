; DESCRIPTION: Renders a green line between points (256, 113) and (255, 19).
; PLAN: r0=256(x1), r1=113(y1), r2=255(x2), r3=19(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 113
LDI r2, 255
LDI r3, 19
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
