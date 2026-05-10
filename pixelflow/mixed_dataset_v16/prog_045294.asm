; DESCRIPTION: Creates a cyan rectangular region at (7, 113) spanning 60 by 27 pixels.
; PLAN: r0=7(x), r1=113(y), r2=60(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 113
LDI r2, 60
LDI r3, 27
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
