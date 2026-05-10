; DESCRIPTION: Draws a green line from (271, 114) to (179, 56).
; PLAN: r0=271(x1), r1=114(y1), r2=179(x2), r3=56(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 114
LDI r2, 179
LDI r3, 56
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
