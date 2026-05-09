; DESCRIPTION: Composite: . Then Places a black line segment connecting (193, 25) to (35, 190). Then Places a red 74x38 rectangle at position (144, 42).
; PLAN: r0=193(x1), r1=25(y1), r2=35(x2), r3=190(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=144(x), r1=42(y), r2=74(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black line segment connecting (193, 25) to (35, 190).
; PLAN: r0=193(x1), r1=25(y1), r2=35(x2), r3=190(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 25
LDI r2, 35
LDI r3, 190
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a red 74x38 rectangle at position (144, 42).
; PLAN: r0=144(x), r1=42(y), r2=74(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 42
LDI r2, 74
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
