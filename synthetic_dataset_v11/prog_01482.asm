; DESCRIPTION: Renders a white box of size 112x61 starting at (36, 160).
; PLAN: r0=36(x), r1=160(y), r2=112(width), r3=61(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 160
LDI r2, 112
LDI r3, 61
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
