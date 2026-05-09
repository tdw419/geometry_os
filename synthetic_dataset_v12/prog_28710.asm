; DESCRIPTION: Creates a black rectangular region at (421, 107) spanning 63 by 120 pixels.
; PLAN: r0=421(x), r1=107(y), r2=63(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 107
LDI r2, 63
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
