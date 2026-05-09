; DESCRIPTION: Creates a cyan rectangular region at (413, 101) spanning 94 by 65 pixels.
; PLAN: r0=413(x), r1=101(y), r2=94(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 101
LDI r2, 94
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
