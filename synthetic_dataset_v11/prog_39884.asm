; DESCRIPTION: Composite: . Then Draws a magenta rectangle at (129, 104) with width 38 and height 117. Then Places a yellow dot at position (104, 28).
; PLAN: r0=129(x), r1=104(y), r2=38(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=104(x), r1=28(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a magenta rectangle at (129, 104) with width 38 and height 117.
; PLAN: r0=129(x), r1=104(y), r2=38(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 104
LDI r2, 38
LDI r3, 117
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow dot at position (104, 28).
; PLAN: r0=104(x), r1=28(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 104
LDI r1, 28
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
