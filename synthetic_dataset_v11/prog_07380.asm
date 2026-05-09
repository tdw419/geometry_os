; DESCRIPTION: Creates a cyan rectangular region at (101, 74) spanning 69 by 96 pixels.
; PLAN: r0=101(x), r1=74(y), r2=69(width), r3=96(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 74
LDI r2, 69
LDI r3, 96
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
