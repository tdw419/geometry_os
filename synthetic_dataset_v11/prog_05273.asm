; DESCRIPTION: Creates a cyan rectangular region at (148, 89) spanning 48 by 85 pixels.
; PLAN: r0=148(x), r1=89(y), r2=48(width), r3=85(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 89
LDI r2, 48
LDI r3, 85
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
