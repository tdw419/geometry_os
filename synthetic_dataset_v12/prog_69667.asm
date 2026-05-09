; DESCRIPTION: Composite: Renders a white box of size 25x53 starting at (210, 69) then Draws a cyan circle centered at (352, 81) with radius 57.
; PLAN: r0=210(x), r1=69(y), r2=25(width), r3=53(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=352(x), r6=81(y), r7=57(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 210
LDI r1, 69
LDI r2, 25
LDI r3, 53
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 352
LDI r6, 81
LDI r7, 57
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
