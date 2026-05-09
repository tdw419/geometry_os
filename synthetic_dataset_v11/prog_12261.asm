; DESCRIPTION: Composite: . Then Renders a magenta disk with center (121, 180) and radius 58. Then Draws a cyan rectangle at (192, 31) with width 56 and height 111.
; PLAN: r0=121(x), r1=180(y), r2=58(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=192(x), r1=31(y), r2=56(width), r3=111(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a magenta disk with center (121, 180) and radius 58.
; PLAN: r0=121(x), r1=180(y), r2=58(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 121
LDI r1, 180
LDI r2, 58
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a cyan rectangle at (192, 31) with width 56 and height 111.
; PLAN: r0=192(x), r1=31(y), r2=56(width), r3=111(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 31
LDI r2, 56
LDI r3, 111
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
