; DESCRIPTION: Renders a green box of size 49x81 starting at (445, 126).
; PLAN: r0=445(x), r1=126(y), r2=49(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 126
LDI r2, 49
LDI r3, 81
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
