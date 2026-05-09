; DESCRIPTION: Renders a green box of size 13x94 starting at (360, 29).
; PLAN: r0=360(x), r1=29(y), r2=13(width), r3=94(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 29
LDI r2, 13
LDI r3, 94
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
