; DESCRIPTION: Renders a white box of size 18x56 starting at (459, 28).
; PLAN: r0=459(x), r1=28(y), r2=18(width), r3=56(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 28
LDI r2, 18
LDI r3, 56
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
