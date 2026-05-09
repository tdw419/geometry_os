; DESCRIPTION: Draws a black line from (183, 114) to (152, 146).
; PLAN: r0=183(x1), r1=114(y1), r2=152(x2), r3=146(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 114
LDI r2, 152
LDI r3, 146
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
