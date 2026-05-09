; DESCRIPTION: Creates a purple rectangular region at (242, 128) spanning 22 by 58 pixels.
; PLAN: r0=242(x), r1=128(y), r2=22(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 128
LDI r2, 22
LDI r3, 58
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
