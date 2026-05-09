; DESCRIPTION: A simple program that loads 10 into r1 and decrements it in a loop until it reaches 0.
; PLAN: r0=311(x), r1=19(y), r2=12(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 151
LDI r2, 11
LDI r3, 111
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT