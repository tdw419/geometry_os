; DESCRIPTION: Creates a orange rectangular region at (12, 48) spanning 83 by 103 pixels.
; PLAN: r0=12(x), r1=48(y), r2=83(width), r3=103(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 48
LDI r2, 83
LDI r3, 103
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
