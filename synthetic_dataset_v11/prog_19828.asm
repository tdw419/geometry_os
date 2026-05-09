; DESCRIPTION: Composite: . Then Creates a orange rectangular region at (93, 29) spanning 97 by 12 pixels. Then Creates a cyan circular shape at (83, 74) with radius 50.
; PLAN: r0=93(x), r1=29(y), r2=97(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=83(x), r1=74(y), r2=50(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a orange rectangular region at (93, 29) spanning 97 by 12 pixels.
; PLAN: r0=93(x), r1=29(y), r2=97(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 29
LDI r2, 97
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a cyan circular shape at (83, 74) with radius 50.
; PLAN: r0=83(x), r1=74(y), r2=50(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 83
LDI r1, 74
LDI r2, 50
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
