; DESCRIPTION: Creates a green rectangular region at (307, 16) spanning 81 by 20 pixels.
; PLAN: r0=307(x), r1=16(y), r2=81(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 16
LDI r2, 81
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
