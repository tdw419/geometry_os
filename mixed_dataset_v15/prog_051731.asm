; DESCRIPTION: Creates a red rectangular region at (37, 203) spanning 98 by 50 pixels.
; PLAN: r0=37(x), r1=203(y), r2=98(width), r3=50(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 203
LDI r2, 98
LDI r3, 50
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
