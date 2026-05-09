; DESCRIPTION: Draws a yellow line from (313, 116) to (254, 177).
; PLAN: r0=313(x1), r1=116(y1), r2=254(x2), r3=177(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 116
LDI r2, 254
LDI r3, 177
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
