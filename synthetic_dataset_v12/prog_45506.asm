; DESCRIPTION: Creates a cyan rectangular region at (274, 57) spanning 67 by 10 pixels.
; PLAN: r0=274(x), r1=57(y), r2=67(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 57
LDI r2, 67
LDI r3, 10
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
