; DESCRIPTION: Creates a red rectangular region at (152, 75) spanning 76 by 100 pixels.
; PLAN: r0=152(x), r1=75(y), r2=76(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 75
LDI r2, 76
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
