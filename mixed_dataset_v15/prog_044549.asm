; DESCRIPTION: Creates a cyan rectangular region at (59, 8) spanning 52 by 21 pixels.
; PLAN: r0=59(x), r1=8(y), r2=52(width), r3=21(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 8
LDI r2, 52
LDI r3, 21
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
