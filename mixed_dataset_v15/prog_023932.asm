; DESCRIPTION: Renders a white box of size 120x30 starting at (312, 134).
; PLAN: r0=312(x), r1=134(y), r2=120(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 134
LDI r2, 120
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
