; DESCRIPTION: Composite: . Then Creates a black rectangular region at (167, 142) spanning 10 by 86 pixels. Then Places a orange dot at position (21, 76).
; PLAN: r0=167(x), r1=142(y), r2=10(width), r3=86(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=21(x), r1=76(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a black rectangular region at (167, 142) spanning 10 by 86 pixels.
; PLAN: r0=167(x), r1=142(y), r2=10(width), r3=86(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 142
LDI r2, 10
LDI r3, 86
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange dot at position (21, 76).
; PLAN: r0=21(x), r1=76(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 21
LDI r1, 76
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
