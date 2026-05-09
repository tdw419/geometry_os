; DESCRIPTION: Creates a yellow rectangular region at (449, 8) spanning 10 by 64 pixels.
; PLAN: r0=449(x), r1=8(y), r2=10(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 8
LDI r2, 10
LDI r3, 64
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
