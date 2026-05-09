; DESCRIPTION: Composite: . Then Creates a orange rectangular region at (42, 208) spanning 82 by 13 pixels. Then Renders a purple disk with center (190, 163) and radius 43.
; PLAN: r0=42(x), r1=208(y), r2=82(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=190(x), r1=163(y), r2=43(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a orange rectangular region at (42, 208) spanning 82 by 13 pixels.
; PLAN: r0=42(x), r1=208(y), r2=82(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 208
LDI r2, 82
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a purple disk with center (190, 163) and radius 43.
; PLAN: r0=190(x), r1=163(y), r2=43(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 190
LDI r1, 163
LDI r2, 43
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
