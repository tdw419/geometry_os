; DESCRIPTION: Renders a black box of size 113x87 starting at (22, 32).
; PLAN: r0=22(x), r1=32(y), r2=113(width), r3=87(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 32
LDI r2, 113
LDI r3, 87
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
