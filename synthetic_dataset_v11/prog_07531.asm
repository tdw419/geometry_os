; DESCRIPTION: Composite: . Then Creates a magenta rectangular region at (216, 1) spanning 12 by 58 pixels. Then Draws a cyan line from (216, 100) to (170, 176).
; PLAN: r0=216(x), r1=1(y), r2=12(width), r3=58(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=216(x1), r1=100(y1), r2=170(x2), r3=176(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a magenta rectangular region at (216, 1) spanning 12 by 58 pixels.
; PLAN: r0=216(x), r1=1(y), r2=12(width), r3=58(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 1
LDI r2, 12
LDI r3, 58
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a cyan line from (216, 100) to (170, 176).
; PLAN: r0=216(x1), r1=100(y1), r2=170(x2), r3=176(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 100
LDI r2, 170
LDI r3, 176
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
