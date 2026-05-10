; DESCRIPTION: A simple program that loads 10 into r1 and decrements it in a loop until it reaches 0.
; PLAN: r0=10(x), r1=10(y), r2=10(width), r3=0(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 10
LDI r2, 10
LDI r3, 0
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT