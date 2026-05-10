; DESCRIPTION: Creates a cyan rectangular region at (275, 13) spanning 64 by 88 pixels.
; PLAN: r0=275(x), r1=13(y), r2=64(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 13
LDI r2, 64
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
