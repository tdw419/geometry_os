; DESCRIPTION: Creates a yellow rectangular region at (168, 32) spanning 20 by 33 pixels.
; PLAN: r0=168(x), r1=32(y), r2=20(width), r3=33(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 32
LDI r2, 20
LDI r3, 33
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
