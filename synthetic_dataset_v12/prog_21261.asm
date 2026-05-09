; DESCRIPTION: Draws a black line from (361, 40) to (64, 42).
; PLAN: r0=361(x1), r1=40(y1), r2=64(x2), r3=42(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 40
LDI r2, 64
LDI r3, 42
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
