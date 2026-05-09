; DESCRIPTION: Draws a blue line from (499, 21) to (294, 117).
; PLAN: r0=499(x1), r1=21(y1), r2=294(x2), r3=117(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 21
LDI r2, 294
LDI r3, 117
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
