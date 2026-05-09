; DESCRIPTION: Draws a magenta line from (122, 7) to (445, 45).
; PLAN: r0=122(x1), r1=7(y1), r2=445(x2), r3=45(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 7
LDI r2, 445
LDI r3, 45
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
