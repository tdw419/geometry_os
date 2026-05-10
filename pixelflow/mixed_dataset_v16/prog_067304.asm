; DESCRIPTION: Creates a green rectangular region at (154, 97) spanning 16 by 97 pixels.
; PLAN: r0=154(x), r1=97(y), r2=16(width), r3=97(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 97
LDI r2, 16
LDI r3, 97
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
