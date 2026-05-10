; DESCRIPTION: Loads 41 into r1 and decrements it in a loop until zero.
; PLAN: r1=41(counter), r2=1(step). Loop: SUB r1, r2 then JNZ r1, loop.
LDI r1, 41
JNZ r1, 4
LDI r2, 1
SUB r1, r2
JNZ r1, loop
HALT
