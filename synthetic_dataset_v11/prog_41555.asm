; DESCRIPTION: Draws a black line from (75, 254) to (126, 21).
; PLAN: r0=75(x1), r1=254(y1), r2=126(x2), r3=21(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 254
LDI r2, 126
LDI r3, 21
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
