; DESCRIPTION: Creates a cyan rectangular region at (155, 131) spanning 85 by 95 pixels.
; PLAN: r0=155(x), r1=131(y), r2=85(width), r3=95(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 131
LDI r2, 85
LDI r3, 95
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
