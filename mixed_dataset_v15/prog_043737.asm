; DESCRIPTION: Draws a black line from (481, 174) to (105, 42).
; PLAN: r0=481(x1), r1=174(y1), r2=105(x2), r3=42(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 174
LDI r2, 105
LDI r3, 42
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
