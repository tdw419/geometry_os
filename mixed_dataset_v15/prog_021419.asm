; DESCRIPTION: Creates a cyan rectangular region at (183, 112) spanning 118 by 91 pixels.
; PLAN: r0=183(x), r1=112(y), r2=118(width), r3=91(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 112
LDI r2, 118
LDI r3, 91
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
