; DESCRIPTION: Composite: . Then Places a green 48x108 rectangle at position (50, 103). Then Draws a orange circle centered at (135, 139) with radius 36.
; PLAN: r0=50(x), r1=103(y), r2=48(width), r3=108(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=135(x), r1=139(y), r2=36(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a green 48x108 rectangle at position (50, 103).
; PLAN: r0=50(x), r1=103(y), r2=48(width), r3=108(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 103
LDI r2, 48
LDI r3, 108
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a orange circle centered at (135, 139) with radius 36.
; PLAN: r0=135(x), r1=139(y), r2=36(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 135
LDI r1, 139
LDI r2, 36
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
