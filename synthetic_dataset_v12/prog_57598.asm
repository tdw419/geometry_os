; DESCRIPTION: Creates a cyan rectangular region at (251, 48) spanning 94 by 118 pixels.
; PLAN: r0=251(x), r1=48(y), r2=94(width), r3=118(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 48
LDI r2, 94
LDI r3, 118
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
