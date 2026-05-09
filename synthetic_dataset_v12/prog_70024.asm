; DESCRIPTION: Creates a black rectangular region at (294, 245) spanning 68 by 11 pixels.
; PLAN: r0=294(x), r1=245(y), r2=68(width), r3=11(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 245
LDI r2, 68
LDI r3, 11
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
