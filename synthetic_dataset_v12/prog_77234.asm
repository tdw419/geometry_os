; DESCRIPTION: Creates a green rectangular region at (179, 66) spanning 82 by 48 pixels.
; PLAN: r0=179(x), r1=66(y), r2=82(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 66
LDI r2, 82
LDI r3, 48
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
