; DESCRIPTION: Creates a green rectangular region at (376, 202) spanning 73 by 27 pixels.
; PLAN: r0=376(x), r1=202(y), r2=73(width), r3=27(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 202
LDI r2, 73
LDI r3, 27
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
