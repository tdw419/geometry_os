; DESCRIPTION: Creates a cyan rectangular region at (271, 84) spanning 71 by 28 pixels.
; PLAN: r0=271(x), r1=84(y), r2=71(width), r3=28(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 84
LDI r2, 71
LDI r3, 28
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
