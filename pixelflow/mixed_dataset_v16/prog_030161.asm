; DESCRIPTION: Composite: Renders a cyan box of size 53x83 starting at (368, 151) then Draws a magenta circle centered at (403, 153) with radius 77.
; PLAN: r0=368(x), r1=151(y), r2=53(width), r3=83(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=403(x), r6=153(y), r7=77(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 368
LDI r1, 151
LDI r2, 53
LDI r3, 83
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 403
LDI r6, 153
LDI r7, 77
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
