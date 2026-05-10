; DESCRIPTION: Draws a black line from (417, 166) to (320, 170).
; PLAN: r0=417(x1), r1=166(y1), r2=320(x2), r3=170(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 166
LDI r2, 320
LDI r3, 170
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
