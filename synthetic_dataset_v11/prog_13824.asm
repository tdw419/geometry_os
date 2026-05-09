; DESCRIPTION: Composite: . Then Renders a yellow line between points (161, 39) and (178, 4). Then Creates a magenta rectangular region at (9, 114) spanning 74 by 28 pixels.
; PLAN: r0=161(x1), r1=39(y1), r2=178(x2), r3=4(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=9(x), r1=114(y), r2=74(width), r3=28(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a yellow line between points (161, 39) and (178, 4).
; PLAN: r0=161(x1), r1=39(y1), r2=178(x2), r3=4(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 39
LDI r2, 178
LDI r3, 4
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a magenta rectangular region at (9, 114) spanning 74 by 28 pixels.
; PLAN: r0=9(x), r1=114(y), r2=74(width), r3=28(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 114
LDI r2, 74
LDI r3, 28
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
