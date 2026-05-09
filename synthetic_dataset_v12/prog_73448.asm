; DESCRIPTION: Creates a orange rectangular region at (117, 28) spanning 76 by 65 pixels.
; PLAN: r0=117(x), r1=28(y), r2=76(width), r3=65(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 28
LDI r2, 76
LDI r3, 65
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
