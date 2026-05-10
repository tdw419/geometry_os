; DESCRIPTION: Creates a cyan rectangular region at (88, 113) spanning 50 by 21 pixels.
; PLAN: r0=88(x), r1=113(y), r2=50(width), r3=21(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 113
LDI r2, 50
LDI r3, 21
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
