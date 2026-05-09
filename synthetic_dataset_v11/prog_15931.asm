; DESCRIPTION: Creates a black rectangular region at (91, 109) spanning 27 by 76 pixels.
; PLAN: r0=91(x), r1=109(y), r2=27(width), r3=76(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 109
LDI r2, 27
LDI r3, 76
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
