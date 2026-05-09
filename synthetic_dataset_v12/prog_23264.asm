; DESCRIPTION: Renders a green box of size 115x94 starting at (198, 24).
; PLAN: r0=198(x), r1=24(y), r2=115(width), r3=94(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 24
LDI r2, 115
LDI r3, 94
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
