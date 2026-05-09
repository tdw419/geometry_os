; DESCRIPTION: Creates a orange rectangular region at (126, 79) spanning 107 by 69 pixels.
; PLAN: r0=126(x), r1=79(y), r2=107(width), r3=69(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 79
LDI r2, 107
LDI r3, 69
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
