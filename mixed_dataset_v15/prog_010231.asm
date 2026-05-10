; DESCRIPTION: Renders a green box of size 107x70 starting at (207, 36).
; PLAN: r0=207(x), r1=36(y), r2=107(width), r3=70(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 36
LDI r2, 107
LDI r3, 70
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
