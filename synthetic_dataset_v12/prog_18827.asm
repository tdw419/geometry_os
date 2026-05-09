; DESCRIPTION: Creates a orange rectangular region at (356, 226) spanning 75 by 13 pixels.
; PLAN: r0=356(x), r1=226(y), r2=75(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 226
LDI r2, 75
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
