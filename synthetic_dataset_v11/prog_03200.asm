; DESCRIPTION: Creates a cyan rectangular region at (39, 113) spanning 28 by 64 pixels.
; PLAN: r0=39(x), r1=113(y), r2=28(width), r3=64(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 113
LDI r2, 28
LDI r3, 64
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
