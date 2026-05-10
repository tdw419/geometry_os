; DESCRIPTION: Renders a black box of size 103x33 starting at (371, 58).
; PLAN: r0=371(x), r1=58(y), r2=103(width), r3=33(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 58
LDI r2, 103
LDI r3, 33
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
