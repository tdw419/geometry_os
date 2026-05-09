; DESCRIPTION: Renders a black box of size 46x60 starting at (87, 92).
; PLAN: r0=87(x), r1=92(y), r2=46(width), r3=60(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 92
LDI r2, 46
LDI r3, 60
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
