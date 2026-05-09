; DESCRIPTION: Draws a black line from (326, 248) to (255, 166).
; PLAN: r0=326(x1), r1=248(y1), r2=255(x2), r3=166(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 248
LDI r2, 255
LDI r3, 166
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
