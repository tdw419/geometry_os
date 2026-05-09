; DESCRIPTION: Renders a black box of size 120x15 starting at (251, 191).
; PLAN: r0=251(x), r1=191(y), r2=120(width), r3=15(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 191
LDI r2, 120
LDI r3, 15
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
