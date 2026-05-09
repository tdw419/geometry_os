; DESCRIPTION: Creates a black rectangular region at (257, 46) spanning 44 by 68 pixels.
; PLAN: r0=257(x), r1=46(y), r2=44(width), r3=68(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 46
LDI r2, 44
LDI r3, 68
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
