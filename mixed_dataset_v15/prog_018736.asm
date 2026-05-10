; DESCRIPTION: Renders a white box of size 82x78 starting at (368, 172).
; PLAN: r0=368(x), r1=172(y), r2=82(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 172
LDI r2, 82
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
