; DESCRIPTION: Places a black line segment connecting (267, 132) to (465, 164).
; PLAN: r0=267(x1), r1=132(y1), r2=465(x2), r3=164(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 132
LDI r2, 465
LDI r3, 164
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
