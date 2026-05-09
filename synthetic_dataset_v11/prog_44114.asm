; DESCRIPTION: Renders a white box of size 79x60 starting at (18, 120).
; PLAN: r0=18(x), r1=120(y), r2=79(width), r3=60(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 120
LDI r2, 79
LDI r3, 60
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
