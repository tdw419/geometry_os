; DESCRIPTION: Draws a black line from (107, 175) to (269, 27).
; PLAN: r0=107(x1), r1=175(y1), r2=269(x2), r3=27(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 175
LDI r2, 269
LDI r3, 27
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
