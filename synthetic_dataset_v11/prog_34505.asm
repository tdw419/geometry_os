; DESCRIPTION: Renders a white box of size 91x68 starting at (93, 150).
; PLAN: r0=93(x), r1=150(y), r2=91(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 150
LDI r2, 91
LDI r3, 68
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
