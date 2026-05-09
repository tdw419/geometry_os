; DESCRIPTION: Renders a black box of size 85x12 starting at (277, 126).
; PLAN: r0=277(x), r1=126(y), r2=85(width), r3=12(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 126
LDI r2, 85
LDI r3, 12
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
