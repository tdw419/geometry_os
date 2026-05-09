; DESCRIPTION: Composite: . Then Places a cyan circle of radius 63 at center (128, 73). Then Creates a white rectangular region at (83, 87) spanning 106 by 40 pixels.
; PLAN: r0=128(x), r1=73(y), r2=63(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=83(x), r1=87(y), r2=106(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan circle of radius 63 at center (128, 73).
; PLAN: r0=128(x), r1=73(y), r2=63(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 128
LDI r1, 73
LDI r2, 63
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a white rectangular region at (83, 87) spanning 106 by 40 pixels.
; PLAN: r0=83(x), r1=87(y), r2=106(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 87
LDI r2, 106
LDI r3, 40
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
