; DESCRIPTION: Creates a orange rectangular region at (370, 126) spanning 102 by 48 pixels.
; PLAN: r0=370(x), r1=126(y), r2=102(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 126
LDI r2, 102
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
