; DESCRIPTION: Creates a orange rectangular region at (69, 12) spanning 50 by 116 pixels.
; PLAN: r0=69(x), r1=12(y), r2=50(width), r3=116(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 12
LDI r2, 50
LDI r3, 116
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
