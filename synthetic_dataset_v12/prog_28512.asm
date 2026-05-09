; DESCRIPTION: Draws a black line from (234, 61) to (267, 134).
; PLAN: r0=234(x1), r1=61(y1), r2=267(x2), r3=134(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 61
LDI r2, 267
LDI r3, 134
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
