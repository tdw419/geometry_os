; DESCRIPTION: Renders a black box of size 58x16 starting at (436, 79).
; PLAN: r0=436(x), r1=79(y), r2=58(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 79
LDI r2, 58
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
