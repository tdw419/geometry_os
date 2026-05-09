; DESCRIPTION: Renders a black box of size 28x56 starting at (101, 160).
; PLAN: r0=101(x), r1=160(y), r2=28(width), r3=56(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 160
LDI r2, 28
LDI r3, 56
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
