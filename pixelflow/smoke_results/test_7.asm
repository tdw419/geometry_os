; DESCRIPTION: A simple program that loads 10 into r1 and decrements it in a loop until it reaches 0.
; PLAN: r0=10(x), r1=10(y), r2=1(step). Loop: SUB r1, r2 then JNZ r1, r3.
LDI r0, 10
LDI r1, 10
LDI r2, 1
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT