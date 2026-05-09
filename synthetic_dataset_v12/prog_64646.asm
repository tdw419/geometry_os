; DESCRIPTION: Draws a black line from (489, 255) to (329, 38).
; PLAN: r0=489(x1), r1=255(y1), r2=329(x2), r3=38(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 255
LDI r2, 329
LDI r3, 38
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
