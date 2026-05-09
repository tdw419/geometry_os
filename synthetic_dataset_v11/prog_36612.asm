; DESCRIPTION: Composite: . Then Creates a red circular shape at (170, 162) with radius 61. Then Draws a black line from (116, 126) to (103, 157).
; PLAN: r0=170(x), r1=162(y), r2=61(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=116(x1), r1=126(y1), r2=103(x2), r3=157(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a red circular shape at (170, 162) with radius 61.
; PLAN: r0=170(x), r1=162(y), r2=61(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 170
LDI r1, 162
LDI r2, 61
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a black line from (116, 126) to (103, 157).
; PLAN: r0=116(x1), r1=126(y1), r2=103(x2), r3=157(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 126
LDI r2, 103
LDI r3, 157
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
