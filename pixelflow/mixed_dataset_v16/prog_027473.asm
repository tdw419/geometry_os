; DESCRIPTION: Creates a cyan rectangular region at (252, 20) spanning 59 by 84 pixels.
; PLAN: r0=252(x), r1=20(y), r2=59(width), r3=84(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 20
LDI r2, 59
LDI r3, 84
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
