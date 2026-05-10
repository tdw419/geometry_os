; DESCRIPTION: Composite: Sets a single white pixel at (216, 202) then Draws a magenta rectangle at (59, 13) with width 28 and height 111 then Places a white circle of radius 27 at center (180, 103).
; PLAN: r0=216(x), r1=202(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=59(x), r6=13(y), r7=28(width), r8=111(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=180(x), r11=103(y), r12=27(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 216
LDI r1, 202
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 59
LDI r6, 13
LDI r7, 28
LDI r8, 111
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 180
LDI r11, 103
LDI r12, 27
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
