; DESCRIPTION: Creates a red rectangular region at (33, 85) spanning 37 by 21 pixels.
; PLAN: r0=33(x), r1=85(y), r2=37(width), r3=21(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 85
LDI r2, 37
LDI r3, 21
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
