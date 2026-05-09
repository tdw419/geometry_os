; DESCRIPTION: Renders a black box of size 55x34 starting at (328, 144).
; PLAN: r0=328(x), r1=144(y), r2=55(width), r3=34(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 144
LDI r2, 55
LDI r3, 34
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
