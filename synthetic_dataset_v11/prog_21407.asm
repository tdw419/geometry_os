; DESCRIPTION: Composite: . Then Places a black line segment connecting (85, 73) to (231, 30). Then Creates a red rectangular region at (118, 20) spanning 116 by 27 pixels.
; PLAN: r0=85(x1), r1=73(y1), r2=231(x2), r3=30(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=118(x), r1=20(y), r2=116(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black line segment connecting (85, 73) to (231, 30).
; PLAN: r0=85(x1), r1=73(y1), r2=231(x2), r3=30(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 73
LDI r2, 231
LDI r3, 30
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a red rectangular region at (118, 20) spanning 116 by 27 pixels.
; PLAN: r0=118(x), r1=20(y), r2=116(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 20
LDI r2, 116
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
