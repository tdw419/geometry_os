; DESCRIPTION: Renders a green box of size 88x120 starting at (12, 50).
; PLAN: r0=12(x), r1=50(y), r2=88(width), r3=120(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 50
LDI r2, 88
LDI r3, 120
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
