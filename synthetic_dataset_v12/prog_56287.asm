; DESCRIPTION: Creates a cyan rectangular region at (130, 96) spanning 118 by 83 pixels.
; PLAN: r0=130(x), r1=96(y), r2=118(width), r3=83(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 96
LDI r2, 118
LDI r3, 83
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
