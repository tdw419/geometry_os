; DESCRIPTION: Creates a blue rectangular region at (284, 36) spanning 13 by 15 pixels.
; PLAN: r0=284(x), r1=36(y), r2=13(width), r3=15(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 36
LDI r2, 13
LDI r3, 15
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
