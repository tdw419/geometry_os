; DESCRIPTION: Renders a white box of size 66x120 starting at (309, 3).
; PLAN: r0=309(x), r1=3(y), r2=66(width), r3=120(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 3
LDI r2, 66
LDI r3, 120
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
