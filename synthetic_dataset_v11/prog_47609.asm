; DESCRIPTION: Renders a white box of size 80x36 starting at (126, 107).
; PLAN: r0=126(x), r1=107(y), r2=80(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 107
LDI r2, 80
LDI r3, 36
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
