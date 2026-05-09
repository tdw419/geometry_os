; DESCRIPTION: Composite: . Then Renders a cyan box of size 60x10 starting at (29, 185). Then Draws a orange circle centered at (61, 193) with radius 49.
; PLAN: r0=29(x), r1=185(y), r2=60(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=61(x), r1=193(y), r2=49(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a cyan box of size 60x10 starting at (29, 185).
; PLAN: r0=29(x), r1=185(y), r2=60(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 185
LDI r2, 60
LDI r3, 10
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a orange circle centered at (61, 193) with radius 49.
; PLAN: r0=61(x), r1=193(y), r2=49(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 61
LDI r1, 193
LDI r2, 49
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
