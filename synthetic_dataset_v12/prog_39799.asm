; DESCRIPTION: Creates a green rectangular region at (179, 86) spanning 109 by 120 pixels.
; PLAN: r0=179(x), r1=86(y), r2=109(width), r3=120(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 86
LDI r2, 109
LDI r3, 120
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
