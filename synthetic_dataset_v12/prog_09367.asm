; DESCRIPTION: Creates a cyan rectangular region at (70, 208) spanning 109 by 31 pixels.
; PLAN: r0=70(x), r1=208(y), r2=109(width), r3=31(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 208
LDI r2, 109
LDI r3, 31
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
