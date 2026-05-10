; DESCRIPTION: Draws a blue line from (338, 67) to (499, 120).
; PLAN: r0=338(x1), r1=67(y1), r2=499(x2), r3=120(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 67
LDI r2, 499
LDI r3, 120
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
