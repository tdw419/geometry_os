; DESCRIPTION: Renders a white box of size 117x107 starting at (46, 74).
; PLAN: r0=46(x), r1=74(y), r2=117(width), r3=107(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 74
LDI r2, 117
LDI r3, 107
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
