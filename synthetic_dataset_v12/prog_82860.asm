; DESCRIPTION: Creates a black rectangular region at (69, 146) spanning 22 by 93 pixels.
; PLAN: r0=69(x), r1=146(y), r2=22(width), r3=93(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 146
LDI r2, 22
LDI r3, 93
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
