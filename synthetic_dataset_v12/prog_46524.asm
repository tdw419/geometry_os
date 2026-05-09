; DESCRIPTION: Creates a cyan rectangular region at (68, 64) spanning 95 by 23 pixels.
; PLAN: r0=68(x), r1=64(y), r2=95(width), r3=23(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 64
LDI r2, 95
LDI r3, 23
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
