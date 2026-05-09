; DESCRIPTION: Renders a black box of size 95x28 starting at (175, 59).
; PLAN: r0=175(x), r1=59(y), r2=95(width), r3=28(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 59
LDI r2, 95
LDI r3, 28
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
