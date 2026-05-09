; DESCRIPTION: Creates a red rectangular region at (281, 15) spanning 20 by 87 pixels.
; PLAN: r0=281(x), r1=15(y), r2=20(width), r3=87(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 15
LDI r2, 20
LDI r3, 87
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
