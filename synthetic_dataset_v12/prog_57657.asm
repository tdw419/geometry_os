; DESCRIPTION: Creates a red rectangular region at (147, 109) spanning 60 by 12 pixels.
; PLAN: r0=147(x), r1=109(y), r2=60(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 109
LDI r2, 60
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
