; DESCRIPTION: Renders a purple line between points (480, 126) and (255, 103).
; PLAN: r0=480(x1), r1=126(y1), r2=255(x2), r3=103(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 126
LDI r2, 255
LDI r3, 103
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
