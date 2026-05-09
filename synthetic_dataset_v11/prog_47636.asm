; DESCRIPTION: Renders a black box of size 20x23 starting at (77, 173).
; PLAN: r0=77(x), r1=173(y), r2=20(width), r3=23(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 173
LDI r2, 20
LDI r3, 23
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
