; DESCRIPTION: Creates a black rectangular region at (154, 10) spanning 61 by 107 pixels.
; PLAN: r0=154(x), r1=10(y), r2=61(width), r3=107(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 10
LDI r2, 61
LDI r3, 107
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
