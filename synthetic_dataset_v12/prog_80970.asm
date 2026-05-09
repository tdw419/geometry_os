; DESCRIPTION: Creates a orange rectangular region at (303, 126) spanning 108 by 27 pixels.
; PLAN: r0=303(x), r1=126(y), r2=108(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 126
LDI r2, 108
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
