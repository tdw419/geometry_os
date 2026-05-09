; DESCRIPTION: Draws a purple line from (464, 236) to (291, 215).
; PLAN: r0=464(x1), r1=236(y1), r2=291(x2), r3=215(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 236
LDI r2, 291
LDI r3, 215
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
