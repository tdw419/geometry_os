; DESCRIPTION: Renders a white box of size 117x90 starting at (353, 107).
; PLAN: r0=353(x), r1=107(y), r2=117(width), r3=90(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 107
LDI r2, 117
LDI r3, 90
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
