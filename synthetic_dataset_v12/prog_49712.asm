; DESCRIPTION: Creates a orange rectangular region at (148, 16) spanning 47 by 103 pixels.
; PLAN: r0=148(x), r1=16(y), r2=47(width), r3=103(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 16
LDI r2, 47
LDI r3, 103
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
