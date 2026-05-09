; DESCRIPTION: Renders a green box of size 13x28 starting at (32, 94).
; PLAN: r0=32(x), r1=94(y), r2=13(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 94
LDI r2, 13
LDI r3, 28
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
