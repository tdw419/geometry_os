; DESCRIPTION: Renders a black box of size 77x48 starting at (117, 20).
; PLAN: r0=117(x), r1=20(y), r2=77(width), r3=48(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 20
LDI r2, 77
LDI r3, 48
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
