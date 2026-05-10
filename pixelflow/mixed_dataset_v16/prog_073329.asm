; DESCRIPTION: Creates a cyan rectangular region at (16, 8) spanning 85 by 94 pixels.
; PLAN: r0=16(x), r1=8(y), r2=85(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 8
LDI r2, 85
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
