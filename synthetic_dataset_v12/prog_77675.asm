; DESCRIPTION: Renders a white box of size 79x28 starting at (150, 10).
; PLAN: r0=150(x), r1=10(y), r2=79(width), r3=28(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 10
LDI r2, 79
LDI r3, 28
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
