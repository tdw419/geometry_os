; DESCRIPTION: Creates a green rectangular region at (339, 120) spanning 42 by 109 pixels.
; PLAN: r0=339(x), r1=120(y), r2=42(width), r3=109(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 120
LDI r2, 42
LDI r3, 109
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
