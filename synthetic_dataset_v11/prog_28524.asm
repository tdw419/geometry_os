; DESCRIPTION: Renders a black box of size 46x31 starting at (79, 224).
; PLAN: r0=79(x), r1=224(y), r2=46(width), r3=31(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 224
LDI r2, 46
LDI r3, 31
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
