; DESCRIPTION: Composite: . Then Places a yellow 20x31 rectangle at position (177, 146). Then Draws a blue circle centered at (68, 85) with radius 43.
; PLAN: r0=177(x), r1=146(y), r2=20(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=68(x), r1=85(y), r2=43(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a yellow 20x31 rectangle at position (177, 146).
; PLAN: r0=177(x), r1=146(y), r2=20(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 146
LDI r2, 20
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a blue circle centered at (68, 85) with radius 43.
; PLAN: r0=68(x), r1=85(y), r2=43(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 68
LDI r1, 85
LDI r2, 43
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
