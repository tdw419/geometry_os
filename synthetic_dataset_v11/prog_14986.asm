; DESCRIPTION: Composite: . Then Draws a purple circle centered at (156, 36) with radius 23. Then Draws a red line from (80, 41) to (87, 151).
; PLAN: r0=156(x), r1=36(y), r2=23(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=80(x1), r1=41(y1), r2=87(x2), r3=151(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a purple circle centered at (156, 36) with radius 23.
; PLAN: r0=156(x), r1=36(y), r2=23(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 36
LDI r2, 23
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a red line from (80, 41) to (87, 151).
; PLAN: r0=80(x1), r1=41(y1), r2=87(x2), r3=151(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 41
LDI r2, 87
LDI r3, 151
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
