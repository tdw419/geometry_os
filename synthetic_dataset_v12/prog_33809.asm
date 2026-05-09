; DESCRIPTION: Renders a black box of size 76x103 starting at (364, 150).
; PLAN: r0=364(x), r1=150(y), r2=76(width), r3=103(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 150
LDI r2, 76
LDI r3, 103
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
