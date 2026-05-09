; DESCRIPTION: Renders a white box of size 74x31 starting at (150, 117).
; PLAN: r0=150(x), r1=117(y), r2=74(width), r3=31(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 117
LDI r2, 74
LDI r3, 31
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
