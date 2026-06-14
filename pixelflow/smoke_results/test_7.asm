; DESCRIPTION: A simple program that loads 10 into r1 and decrements it in a loop until it reaches 0.
; PLAN: r1=10(counter), r2=1(step). Loop: SUB r1, loop.
LDI r1, 10
LDI r2, 1
SUB r1, r2
JNZ r1, loop
JNZ r1, loop
HALT