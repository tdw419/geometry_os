; DESCRIPTION: Creates a red rectangular region at (160, 69) spanning 21 by 90 pixels.
; PLAN: r0=160(x), r1=69(y), r2=21(width), r3=90(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 69
LDI r2, 21
LDI r3, 90
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
