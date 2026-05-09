; DESCRIPTION: Renders a white box of size 89x85 starting at (21, 107).
; PLAN: r0=21(x), r1=107(y), r2=89(width), r3=85(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 107
LDI r2, 89
LDI r3, 85
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
