; DESCRIPTION: Renders a green box of size 113x107 starting at (205, 21).
; PLAN: r0=205(x), r1=21(y), r2=113(width), r3=107(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 21
LDI r2, 113
LDI r3, 107
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
