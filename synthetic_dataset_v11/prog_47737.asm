; DESCRIPTION: Creates a cyan rectangular region at (70, 92) spanning 88 by 111 pixels.
; PLAN: r0=70(x), r1=92(y), r2=88(width), r3=111(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 92
LDI r2, 88
LDI r3, 111
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
