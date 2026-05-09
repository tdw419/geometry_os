; DESCRIPTION: Draws a black line from (30, 192) to (218, 166).
; PLAN: r0=30(x1), r1=192(y1), r2=218(x2), r3=166(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 192
LDI r2, 218
LDI r3, 166
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
