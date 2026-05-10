; DESCRIPTION: Composite: Places a magenta circle of radius 25 at center (415, 127) then Draws a green rectangle at (240, 129) with width 37 and height 38.
; PLAN: r0=415(x), r1=127(y), r2=25(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=240(x), r6=129(y), r7=37(width), r8=38(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 415
LDI r1, 127
LDI r2, 25
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 240
LDI r6, 129
LDI r7, 37
LDI r8, 38
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
