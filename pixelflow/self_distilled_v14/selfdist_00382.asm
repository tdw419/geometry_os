; DESCRIPTION: Creates a cyan filled rectangle of size 46x69 starting at (53, 181).
; PLAN: r0=53(x), r1=181(y), r2=46(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 181
LDI r2, 46
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
