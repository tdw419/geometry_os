; DESCRIPTION: Renders a white box of size 112x85 starting at (127, 61).
; PLAN: r0=127(x), r1=61(y), r2=112(width), r3=85(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 61
LDI r2, 112
LDI r3, 85
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
