; DESCRIPTION: Creates a cyan rectangular region at (345, 88) spanning 71 by 67 pixels.
; PLAN: r0=345(x), r1=88(y), r2=71(width), r3=67(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 88
LDI r2, 71
LDI r3, 67
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
