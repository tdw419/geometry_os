; DESCRIPTION: Composite: . Then Draws a cyan circle centered at (87, 106) with radius 74. Then Places a blue 85x108 rectangle at position (133, 47).
; PLAN: r0=87(x), r1=106(y), r2=74(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=133(x), r1=47(y), r2=85(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a cyan circle centered at (87, 106) with radius 74.
; PLAN: r0=87(x), r1=106(y), r2=74(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 106
LDI r2, 74
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a blue 85x108 rectangle at position (133, 47).
; PLAN: r0=133(x), r1=47(y), r2=85(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 47
LDI r2, 85
LDI r3, 108
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
