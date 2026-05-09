; DESCRIPTION: Draws a green line from (412, 178) to (114, 194).
; PLAN: r0=412(x1), r1=178(y1), r2=114(x2), r3=194(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 178
LDI r2, 114
LDI r3, 194
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
