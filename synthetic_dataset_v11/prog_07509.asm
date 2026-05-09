; DESCRIPTION: Places a yellow line segment connecting (74, 146) to (143, 246).
; PLAN: r0=74(x1), r1=146(y1), r2=143(x2), r3=246(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 146
LDI r2, 143
LDI r3, 246
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
