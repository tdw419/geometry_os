; DESCRIPTION: Creates a yellow rectangular region at (120, 66) spanning 78 by 50 pixels.
; PLAN: r0=120(x), r1=66(y), r2=78(width), r3=50(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 66
LDI r2, 78
LDI r3, 50
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
