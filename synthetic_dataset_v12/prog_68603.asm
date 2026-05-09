; DESCRIPTION: Renders a black box of size 112x54 starting at (342, 70).
; PLAN: r0=342(x), r1=70(y), r2=112(width), r3=54(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 70
LDI r2, 112
LDI r3, 54
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
