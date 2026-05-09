; DESCRIPTION: Creates a cyan rectangular region at (424, 28) spanning 67 by 92 pixels.
; PLAN: r0=424(x), r1=28(y), r2=67(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 28
LDI r2, 67
LDI r3, 92
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
