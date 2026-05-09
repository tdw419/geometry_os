; DESCRIPTION: Composite: . Then Places a cyan circle of radius 59 at center (148, 133). Then Draws a magenta rectangle at (121, 172) with width 116 and height 26.
; PLAN: r0=148(x), r1=133(y), r2=59(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=121(x), r1=172(y), r2=116(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan circle of radius 59 at center (148, 133).
; PLAN: r0=148(x), r1=133(y), r2=59(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 148
LDI r1, 133
LDI r2, 59
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a magenta rectangle at (121, 172) with width 116 and height 26.
; PLAN: r0=121(x), r1=172(y), r2=116(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 172
LDI r2, 116
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
