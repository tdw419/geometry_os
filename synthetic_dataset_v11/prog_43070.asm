; DESCRIPTION: Creates a cyan rectangular region at (25, 113) spanning 82 by 110 pixels.
; PLAN: r0=25(x), r1=113(y), r2=82(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 113
LDI r2, 82
LDI r3, 110
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
