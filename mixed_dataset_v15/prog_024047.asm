; DESCRIPTION: Renders a black box of size 28x55 starting at (187, 4).
; PLAN: r0=187(x), r1=4(y), r2=28(width), r3=55(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 4
LDI r2, 28
LDI r3, 55
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
