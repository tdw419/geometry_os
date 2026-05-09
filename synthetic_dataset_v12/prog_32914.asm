; DESCRIPTION: Places a yellow line segment connecting (465, 127) to (228, 153).
; PLAN: r0=465(x1), r1=127(y1), r2=228(x2), r3=153(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 127
LDI r2, 228
LDI r3, 153
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
