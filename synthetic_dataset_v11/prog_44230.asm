; DESCRIPTION: Creates a orange rectangular region at (26, 39) spanning 16 by 79 pixels.
; PLAN: r0=26(x), r1=39(y), r2=16(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 39
LDI r2, 16
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
