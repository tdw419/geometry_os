; DESCRIPTION: Creates a orange rectangular region at (154, 95) spanning 76 by 44 pixels.
; PLAN: r0=154(x), r1=95(y), r2=76(width), r3=44(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 95
LDI r2, 76
LDI r3, 44
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
