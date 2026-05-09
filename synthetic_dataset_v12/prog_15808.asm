; DESCRIPTION: Creates a green rectangular region at (405, 0) spanning 64 by 67 pixels.
; PLAN: r0=405(x), r1=0(y), r2=64(width), r3=67(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 0
LDI r2, 64
LDI r3, 67
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
