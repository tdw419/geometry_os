; DESCRIPTION: Renders a blue box of size 47x61 starting at (182, 129).
; PLAN: r0=182(x), r1=129(y), r2=47(width), r3=61(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 129
LDI r2, 47
LDI r3, 61
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
