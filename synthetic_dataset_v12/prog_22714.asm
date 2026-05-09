; DESCRIPTION: Draws a magenta line from (445, 162) to (481, 172).
; PLAN: r0=445(x1), r1=162(y1), r2=481(x2), r3=172(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 162
LDI r2, 481
LDI r3, 172
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
