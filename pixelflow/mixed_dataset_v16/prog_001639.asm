; DESCRIPTION: Renders a white box of size 116x54 starting at (340, 7).
; PLAN: r0=340(x), r1=7(y), r2=116(width), r3=54(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 7
LDI r2, 116
LDI r3, 54
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
