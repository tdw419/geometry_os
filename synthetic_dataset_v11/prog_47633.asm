; DESCRIPTION: Creates a green rectangular region at (154, 14) spanning 56 by 113 pixels.
; PLAN: r0=154(x), r1=14(y), r2=56(width), r3=113(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 14
LDI r2, 56
LDI r3, 113
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
