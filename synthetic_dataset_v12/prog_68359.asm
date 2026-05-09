; DESCRIPTION: Renders a black box of size 10x12 starting at (373, 240).
; PLAN: r0=373(x), r1=240(y), r2=10(width), r3=12(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 240
LDI r2, 10
LDI r3, 12
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
