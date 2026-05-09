; DESCRIPTION: Composite: . Then Creates a orange rectangular region at (59, 3) spanning 85 by 59 pixels. Then Creates a cyan circular shape at (173, 163) with radius 51.
; PLAN: r0=59(x), r1=3(y), r2=85(width), r3=59(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=173(x), r1=163(y), r2=51(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a orange rectangular region at (59, 3) spanning 85 by 59 pixels.
; PLAN: r0=59(x), r1=3(y), r2=85(width), r3=59(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 3
LDI r2, 85
LDI r3, 59
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a cyan circular shape at (173, 163) with radius 51.
; PLAN: r0=173(x), r1=163(y), r2=51(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 173
LDI r1, 163
LDI r2, 51
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
