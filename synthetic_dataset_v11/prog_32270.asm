; DESCRIPTION: Creates a orange rectangular region at (192, 12) spanning 61 by 103 pixels.
; PLAN: r0=192(x), r1=12(y), r2=61(width), r3=103(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 12
LDI r2, 61
LDI r3, 103
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
