; DESCRIPTION: Creates a orange rectangular region at (165, 73) spanning 50 by 102 pixels.
; PLAN: r0=165(x), r1=73(y), r2=50(width), r3=102(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 73
LDI r2, 50
LDI r3, 102
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
