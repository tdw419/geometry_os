; DESCRIPTION: Renders a white box of size 60x27 starting at (162, 72).
; PLAN: r0=162(x), r1=72(y), r2=60(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 72
LDI r2, 60
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
