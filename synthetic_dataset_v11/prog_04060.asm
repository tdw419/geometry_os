; DESCRIPTION: Creates a yellow rectangular region at (176, 42) spanning 77 by 94 pixels.
; PLAN: r0=176(x), r1=42(y), r2=77(width), r3=94(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 42
LDI r2, 77
LDI r3, 94
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
