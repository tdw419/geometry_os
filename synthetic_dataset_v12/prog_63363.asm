; DESCRIPTION: Creates a cyan rectangular region at (90, 130) spanning 37 by 118 pixels.
; PLAN: r0=90(x), r1=130(y), r2=37(width), r3=118(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 130
LDI r2, 37
LDI r3, 118
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
