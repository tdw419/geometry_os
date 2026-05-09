; DESCRIPTION: Creates a white rectangular region at (147, 149) spanning 93 by 42 pixels.
; PLAN: r0=147(x), r1=149(y), r2=93(width), r3=42(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 149
LDI r2, 93
LDI r3, 42
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
