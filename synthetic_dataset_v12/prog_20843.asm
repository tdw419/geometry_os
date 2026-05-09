; DESCRIPTION: Creates a cyan rectangular region at (129, 67) spanning 55 by 107 pixels.
; PLAN: r0=129(x), r1=67(y), r2=55(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 67
LDI r2, 55
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
