; DESCRIPTION: Places a yellow line segment connecting (121, 228) to (17, 175).
; PLAN: r0=121(x1), r1=228(y1), r2=17(x2), r3=175(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 228
LDI r2, 17
LDI r3, 175
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
