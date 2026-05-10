; DESCRIPTION: Creates a orange rectangular region at (21, 126) spanning 33 by 89 pixels.
; PLAN: r0=21(x), r1=126(y), r2=33(width), r3=89(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 126
LDI r2, 33
LDI r3, 89
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
