; DESCRIPTION: Draws a black line from (445, 109) to (330, 52).
; PLAN: r0=445(x1), r1=109(y1), r2=330(x2), r3=52(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 109
LDI r2, 330
LDI r3, 52
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
