; DESCRIPTION: Creates a orange rectangular region at (147, 80) spanning 42 by 107 pixels.
; PLAN: r0=147(x), r1=80(y), r2=42(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 80
LDI r2, 42
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
