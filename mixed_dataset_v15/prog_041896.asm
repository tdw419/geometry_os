; DESCRIPTION: Draws a black line from (492, 228) to (332, 19).
; PLAN: r0=492(x1), r1=228(y1), r2=332(x2), r3=19(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 228
LDI r2, 332
LDI r3, 19
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
