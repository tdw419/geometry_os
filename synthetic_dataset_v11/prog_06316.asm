; DESCRIPTION: Creates a green rectangular region at (186, 74) spanning 42 by 35 pixels.
; PLAN: r0=186(x), r1=74(y), r2=42(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 74
LDI r2, 42
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
