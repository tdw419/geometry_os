; DESCRIPTION: Composite: . Then Draws a cyan line from (240, 59) to (101, 224). Then Draws a magenta rectangle at (102, 165) with width 86 and height 24.
; PLAN: r0=240(x1), r1=59(y1), r2=101(x2), r3=224(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=102(x), r1=165(y), r2=86(width), r3=24(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a cyan line from (240, 59) to (101, 224).
; PLAN: r0=240(x1), r1=59(y1), r2=101(x2), r3=224(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 59
LDI r2, 101
LDI r3, 224
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a magenta rectangle at (102, 165) with width 86 and height 24.
; PLAN: r0=102(x), r1=165(y), r2=86(width), r3=24(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 165
LDI r2, 86
LDI r3, 24
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
