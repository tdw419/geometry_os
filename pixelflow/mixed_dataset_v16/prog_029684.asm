; DESCRIPTION: Renders a green box of size 29x20 starting at (303, 5).
; PLAN: r0=303(x), r1=5(y), r2=29(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 5
LDI r2, 29
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
