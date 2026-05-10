; DESCRIPTION: Creates a cyan rectangular region at (316, 89) spanning 54 by 20 pixels.
; PLAN: r0=316(x), r1=89(y), r2=54(width), r3=20(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 89
LDI r2, 54
LDI r3, 20
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
