; DESCRIPTION: Draws a green line from (114, 78) to (82, 22).
; PLAN: r0=114(x1), r1=78(y1), r2=82(x2), r3=22(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 78
LDI r2, 82
LDI r3, 22
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
