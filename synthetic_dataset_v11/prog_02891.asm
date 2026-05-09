; DESCRIPTION: Creates a red rectangular region at (69, 65) spanning 109 by 11 pixels.
; PLAN: r0=69(x), r1=65(y), r2=109(width), r3=11(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 65
LDI r2, 109
LDI r3, 11
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
