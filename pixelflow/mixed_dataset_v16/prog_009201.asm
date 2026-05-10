; DESCRIPTION: Creates a cyan rectangular region at (129, 163) spanning 67 by 83 pixels.
; PLAN: r0=129(x), r1=163(y), r2=67(width), r3=83(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 163
LDI r2, 67
LDI r3, 83
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
