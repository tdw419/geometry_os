; DESCRIPTION: Renders a black box of size 74x66 starting at (425, 150).
; PLAN: r0=425(x), r1=150(y), r2=74(width), r3=66(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 150
LDI r2, 74
LDI r3, 66
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
