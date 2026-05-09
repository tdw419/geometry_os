; DESCRIPTION: Composite: . Then Renders a magenta box of size 53x22 starting at (36, 31). Then Draws a black line from (183, 235) to (138, 81).
; PLAN: r0=36(x), r1=31(y), r2=53(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=183(x1), r1=235(y1), r2=138(x2), r3=81(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a magenta box of size 53x22 starting at (36, 31).
; PLAN: r0=36(x), r1=31(y), r2=53(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 31
LDI r2, 53
LDI r3, 22
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a black line from (183, 235) to (138, 81).
; PLAN: r0=183(x1), r1=235(y1), r2=138(x2), r3=81(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 235
LDI r2, 138
LDI r3, 81
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
