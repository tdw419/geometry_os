; DESCRIPTION: Creates a red rectangular region at (62, 134) spanning 48 by 30 pixels.
; PLAN: r0=62(x), r1=134(y), r2=48(width), r3=30(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 134
LDI r2, 48
LDI r3, 30
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
