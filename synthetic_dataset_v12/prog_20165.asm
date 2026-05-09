; DESCRIPTION: Creates a orange rectangular region at (243, 39) spanning 55 by 72 pixels.
; PLAN: r0=243(x), r1=39(y), r2=55(width), r3=72(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 39
LDI r2, 55
LDI r3, 72
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
