; DESCRIPTION: Creates a cyan rectangular region at (50, 159) spanning 89 by 70 pixels.
; PLAN: r0=50(x), r1=159(y), r2=89(width), r3=70(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 159
LDI r2, 89
LDI r3, 70
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
