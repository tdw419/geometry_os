; DESCRIPTION: Creates a cyan rectangular region at (165, 224) spanning 68 by 32 pixels.
; PLAN: r0=165(x), r1=224(y), r2=68(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 224
LDI r2, 68
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
