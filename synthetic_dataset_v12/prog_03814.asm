; DESCRIPTION: Draws a black line from (268, 61) to (33, 132).
; PLAN: r0=268(x1), r1=61(y1), r2=33(x2), r3=132(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 61
LDI r2, 33
LDI r3, 132
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
