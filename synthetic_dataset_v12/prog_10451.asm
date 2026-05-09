; DESCRIPTION: Draws a orange line from (488, 27) to (267, 56).
; PLAN: r0=488(x1), r1=27(y1), r2=267(x2), r3=56(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 27
LDI r2, 267
LDI r3, 56
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
