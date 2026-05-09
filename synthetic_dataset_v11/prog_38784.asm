; DESCRIPTION: Renders a white box of size 85x70 starting at (95, 61).
; PLAN: r0=95(x), r1=61(y), r2=85(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 61
LDI r2, 85
LDI r3, 70
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
