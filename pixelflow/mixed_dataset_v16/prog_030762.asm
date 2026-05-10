; DESCRIPTION: Creates a cyan rectangular region at (151, 130) spanning 32 by 94 pixels.
; PLAN: r0=151(x), r1=130(y), r2=32(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 130
LDI r2, 32
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
