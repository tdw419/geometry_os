; DESCRIPTION: Renders a black box of size 28x29 starting at (305, 6).
; PLAN: r0=305(x), r1=6(y), r2=28(width), r3=29(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 6
LDI r2, 28
LDI r3, 29
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
