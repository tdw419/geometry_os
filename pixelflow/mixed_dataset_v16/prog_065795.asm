; DESCRIPTION: Creates a white rectangular region at (231, 120) spanning 32 by 118 pixels.
; PLAN: r0=231(x), r1=120(y), r2=32(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 120
LDI r2, 32
LDI r3, 118
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
