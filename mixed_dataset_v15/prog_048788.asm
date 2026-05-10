; DESCRIPTION: Renders a green box of size 98x62 starting at (239, 120).
; PLAN: r0=239(x), r1=120(y), r2=98(width), r3=62(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 120
LDI r2, 98
LDI r3, 62
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
