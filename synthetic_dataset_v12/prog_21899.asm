; DESCRIPTION: Creates a cyan rectangular region at (129, 19) spanning 117 by 24 pixels.
; PLAN: r0=129(x), r1=19(y), r2=117(width), r3=24(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 19
LDI r2, 117
LDI r3, 24
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
