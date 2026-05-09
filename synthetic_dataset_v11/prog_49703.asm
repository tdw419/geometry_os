; DESCRIPTION: Composite: . Then Draws a magenta rectangle at (55, 129) with width 42 and height 63. Then Places a yellow circle of radius 31 at center (94, 192).
; PLAN: r0=55(x), r1=129(y), r2=42(width), r3=63(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=94(x), r1=192(y), r2=31(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a magenta rectangle at (55, 129) with width 42 and height 63.
; PLAN: r0=55(x), r1=129(y), r2=42(width), r3=63(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 129
LDI r2, 42
LDI r3, 63
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow circle of radius 31 at center (94, 192).
; PLAN: r0=94(x), r1=192(y), r2=31(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 94
LDI r1, 192
LDI r2, 31
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
