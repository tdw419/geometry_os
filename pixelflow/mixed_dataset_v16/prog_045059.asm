; DESCRIPTION: Creates a cyan rectangular region at (290, 66) spanning 98 by 113 pixels.
; PLAN: r0=290(x), r1=66(y), r2=98(width), r3=113(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 66
LDI r2, 98
LDI r3, 113
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
