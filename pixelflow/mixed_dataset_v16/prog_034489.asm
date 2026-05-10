; DESCRIPTION: Creates a cyan rectangular region at (87, 113) spanning 77 by 17 pixels.
; PLAN: r0=87(x), r1=113(y), r2=77(width), r3=17(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 113
LDI r2, 77
LDI r3, 17
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
