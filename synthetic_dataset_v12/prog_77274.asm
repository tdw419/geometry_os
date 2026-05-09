; DESCRIPTION: Creates a red rectangular region at (176, 147) spanning 70 by 70 pixels.
; PLAN: r0=176(x), r1=147(y), r2=70(width), r3=70(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 147
LDI r2, 70
LDI r3, 70
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
