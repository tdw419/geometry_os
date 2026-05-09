; DESCRIPTION: Creates a cyan rectangular region at (392, 113) spanning 19 by 60 pixels.
; PLAN: r0=392(x), r1=113(y), r2=19(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 113
LDI r2, 19
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
