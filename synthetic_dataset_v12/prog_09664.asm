; DESCRIPTION: Creates a green rectangular region at (212, 93) spanning 12 by 103 pixels.
; PLAN: r0=212(x), r1=93(y), r2=12(width), r3=103(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 93
LDI r2, 12
LDI r3, 103
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
