; DESCRIPTION: A simple program that loads 10 into r1 and decrements it in a loop until it reaches 0.
; PLAN: r1=10(x), r1=10(y), r2=10(step). Loop then JNZ r1, loop.
loop SUB r1, r2, r3.
LDI r1, 10
loop
p ange.
LDI r2, 10
LDI r3, 0xFF8800
LDI r5, 0
x_loop thena.
PSET r2, r3, r4
HALT