; DESCRIPTION: Renders a black box of size 38x79 starting at (425, 22).
; PLAN: r0=425(x), r1=22(y), r2=38(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 22
LDI r2, 38
LDI r3, 79
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
