; DESCRIPTION: Creates a orange rectangular region at (243, 66) spanning 62 by 27 pixels.
; PLAN: r0=243(x), r1=66(y), r2=62(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 66
LDI r2, 62
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
