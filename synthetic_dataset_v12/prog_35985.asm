; DESCRIPTION: Creates a cyan rectangular region at (172, 31) spanning 48 by 50 pixels.
; PLAN: r0=172(x), r1=31(y), r2=48(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 31
LDI r2, 48
LDI r3, 50
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
