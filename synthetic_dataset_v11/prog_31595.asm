; DESCRIPTION: Draws a black line from (167, 42) to (19, 5).
; PLAN: r0=167(x1), r1=42(y1), r2=19(x2), r3=5(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 42
LDI r2, 19
LDI r3, 5
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
