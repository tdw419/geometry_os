; DESCRIPTION: Renders a white box of size 106x115 starting at (370, 69).
; PLAN: r0=370(x), r1=69(y), r2=106(width), r3=115(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 69
LDI r2, 106
LDI r3, 115
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
