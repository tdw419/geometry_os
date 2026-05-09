; DESCRIPTION: Creates a cyan rectangular region at (85, 131) spanning 22 by 115 pixels.
; PLAN: r0=85(x), r1=131(y), r2=22(width), r3=115(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 131
LDI r2, 22
LDI r3, 115
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
