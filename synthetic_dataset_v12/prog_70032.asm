; DESCRIPTION: Renders a green box of size 94x52 starting at (411, 73).
; PLAN: r0=411(x), r1=73(y), r2=94(width), r3=52(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 73
LDI r2, 94
LDI r3, 52
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
