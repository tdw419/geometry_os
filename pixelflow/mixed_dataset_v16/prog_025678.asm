; DESCRIPTION: Draws a black line from (497, 245) to (180, 228).
; PLAN: r0=497(x1), r1=245(y1), r2=180(x2), r3=228(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 245
LDI r2, 180
LDI r3, 228
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
