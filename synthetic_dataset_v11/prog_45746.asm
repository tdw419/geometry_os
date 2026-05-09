; DESCRIPTION: Composite: . Then Renders a magenta box of size 10x45 starting at (190, 93). Then Draws a purple line from (182, 221) to (221, 123).
; PLAN: r0=190(x), r1=93(y), r2=10(width), r3=45(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=182(x1), r1=221(y1), r2=221(x2), r3=123(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a magenta box of size 10x45 starting at (190, 93).
; PLAN: r0=190(x), r1=93(y), r2=10(width), r3=45(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 93
LDI r2, 10
LDI r3, 45
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a purple line from (182, 221) to (221, 123).
; PLAN: r0=182(x1), r1=221(y1), r2=221(x2), r3=123(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 221
LDI r2, 221
LDI r3, 123
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
