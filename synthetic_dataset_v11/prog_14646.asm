; DESCRIPTION: Renders a white box of size 112x15 starting at (54, 221).
; PLAN: r0=54(x), r1=221(y), r2=112(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 221
LDI r2, 112
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
