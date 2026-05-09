; DESCRIPTION: Renders a white box of size 68x79 starting at (101, 50).
; PLAN: r0=101(x), r1=50(y), r2=68(width), r3=79(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 50
LDI r2, 68
LDI r3, 79
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
