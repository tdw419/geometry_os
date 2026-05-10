; DESCRIPTION: Draws a orange line from (445, 114) to (322, 52).
; PLAN: r0=445(x1), r1=114(y1), r2=322(x2), r3=52(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 114
LDI r2, 322
LDI r3, 52
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
