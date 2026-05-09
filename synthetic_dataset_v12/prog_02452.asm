; DESCRIPTION: Creates a orange rectangular region at (16, 144) spanning 39 by 90 pixels.
; PLAN: r0=16(x), r1=144(y), r2=39(width), r3=90(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 144
LDI r2, 39
LDI r3, 90
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
