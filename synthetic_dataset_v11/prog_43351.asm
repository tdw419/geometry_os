; DESCRIPTION: Composite: . Then Creates a white rectangular region at (30, 204) spanning 84 by 32 pixels. Then Places a yellow dot at position (10, 62).
; PLAN: r0=30(x), r1=204(y), r2=84(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=10(x), r1=62(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a white rectangular region at (30, 204) spanning 84 by 32 pixels.
; PLAN: r0=30(x), r1=204(y), r2=84(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 204
LDI r2, 84
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow dot at position (10, 62).
; PLAN: r0=10(x), r1=62(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 10
LDI r1, 62
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
