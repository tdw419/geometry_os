; DESCRIPTION: Renders a white box of size 107x120 starting at (11, 65).
; PLAN: r0=11(x), r1=65(y), r2=107(width), r3=120(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 65
LDI r2, 107
LDI r3, 120
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
