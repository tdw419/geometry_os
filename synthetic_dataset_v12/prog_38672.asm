; DESCRIPTION: Creates a cyan rectangular region at (373, 54) spanning 11 by 98 pixels.
; PLAN: r0=373(x), r1=54(y), r2=11(width), r3=98(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 54
LDI r2, 11
LDI r3, 98
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
