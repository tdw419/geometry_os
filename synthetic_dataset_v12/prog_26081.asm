; DESCRIPTION: Creates a black rectangular region at (212, 6) spanning 50 by 103 pixels.
; PLAN: r0=212(x), r1=6(y), r2=50(width), r3=103(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 6
LDI r2, 50
LDI r3, 103
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
