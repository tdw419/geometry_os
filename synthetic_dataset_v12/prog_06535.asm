; DESCRIPTION: Creates a cyan rectangular region at (294, 36) spanning 118 by 23 pixels.
; PLAN: r0=294(x), r1=36(y), r2=118(width), r3=23(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 36
LDI r2, 118
LDI r3, 23
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
