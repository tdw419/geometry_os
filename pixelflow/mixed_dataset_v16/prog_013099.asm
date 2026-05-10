; DESCRIPTION: Renders a white box of size 33x120 starting at (217, 56).
; PLAN: r0=217(x), r1=56(y), r2=33(width), r3=120(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 56
LDI r2, 33
LDI r3, 120
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
