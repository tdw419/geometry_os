; DESCRIPTION: Composite: . Then Places a purple 12x90 rectangle at position (190, 36). Then Draws a orange circle centered at (45, 169) with radius 32.
; PLAN: r0=190(x), r1=36(y), r2=12(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=45(x), r1=169(y), r2=32(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a purple 12x90 rectangle at position (190, 36).
; PLAN: r0=190(x), r1=36(y), r2=12(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 36
LDI r2, 12
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a orange circle centered at (45, 169) with radius 32.
; PLAN: r0=45(x), r1=169(y), r2=32(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 45
LDI r1, 169
LDI r2, 32
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
