; DESCRIPTION: Creates a cyan rectangular region at (159, 48) spanning 85 by 25 pixels.
; PLAN: r0=159(x), r1=48(y), r2=85(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 48
LDI r2, 85
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
