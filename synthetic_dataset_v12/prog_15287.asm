; DESCRIPTION: Creates a cyan rectangular region at (295, 64) spanning 72 by 115 pixels.
; PLAN: r0=295(x), r1=64(y), r2=72(width), r3=115(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 64
LDI r2, 72
LDI r3, 115
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
