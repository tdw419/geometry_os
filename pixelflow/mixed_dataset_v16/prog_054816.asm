; DESCRIPTION: Renders a green box of size 62x50 starting at (230, 27).
; PLAN: r0=230(x), r1=27(y), r2=62(width), r3=50(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 27
LDI r2, 62
LDI r3, 50
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
