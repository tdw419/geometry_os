; DESCRIPTION: Renders a black box of size 55x32 starting at (260, 3).
; PLAN: r0=260(x), r1=3(y), r2=55(width), r3=32(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 3
LDI r2, 55
LDI r3, 32
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
