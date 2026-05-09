; DESCRIPTION: A simple program that loads 10 into r1 and decrements it in a loop until it reaches 0.

LDI r1, 0
loop:
LDI r2, 10
SUB r1, r2
JNZ r1, loop
HALT