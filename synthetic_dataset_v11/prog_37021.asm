; DESCRIPTION: Composite: . Then Sets a single yellow pixel at (223, 17). Then Creates a orange rectangular region at (128, 41) spanning 63 by 63 pixels.
; PLAN: r0=223(x), r1=17(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=128(x), r1=41(y), r2=63(width), r3=63(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single yellow pixel at (223, 17).
; PLAN: r0=223(x), r1=17(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 223
LDI r1, 17
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Creates a orange rectangular region at (128, 41) spanning 63 by 63 pixels.
; PLAN: r0=128(x), r1=41(y), r2=63(width), r3=63(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 41
LDI r2, 63
LDI r3, 63
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
