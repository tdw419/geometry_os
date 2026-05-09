; DESCRIPTION: Creates a cyan rectangular region at (118, 124) spanning 54 by 52 pixels.
; PLAN: r0=118(x), r1=124(y), r2=54(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 124
LDI r2, 54
LDI r3, 52
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
