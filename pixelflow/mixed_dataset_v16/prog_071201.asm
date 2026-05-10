; DESCRIPTION: Creates a red rectangular region at (154, 47) spanning 119 by 69 pixels.
; PLAN: r0=154(x), r1=47(y), r2=119(width), r3=69(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 47
LDI r2, 119
LDI r3, 69
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
