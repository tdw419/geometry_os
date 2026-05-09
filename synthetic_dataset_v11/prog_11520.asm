; DESCRIPTION: Composite: . Then Renders a cyan box of size 94x40 starting at (34, 156). Then Draws a orange circle centered at (216, 71) with radius 34.
; PLAN: r0=34(x), r1=156(y), r2=94(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=216(x), r1=71(y), r2=34(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a cyan box of size 94x40 starting at (34, 156).
; PLAN: r0=34(x), r1=156(y), r2=94(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 156
LDI r2, 94
LDI r3, 40
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a orange circle centered at (216, 71) with radius 34.
; PLAN: r0=216(x), r1=71(y), r2=34(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 71
LDI r2, 34
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
