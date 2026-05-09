; DESCRIPTION: Draws a orange line from (146, 92) to (284, 235).
; PLAN: r0=146(x1), r1=92(y1), r2=284(x2), r3=235(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 92
LDI r2, 284
LDI r3, 235
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
