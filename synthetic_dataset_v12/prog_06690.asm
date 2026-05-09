; DESCRIPTION: Creates a cyan rectangular region at (175, 95) spanning 116 by 67 pixels.
; PLAN: r0=175(x), r1=95(y), r2=116(width), r3=67(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 95
LDI r2, 116
LDI r3, 67
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
