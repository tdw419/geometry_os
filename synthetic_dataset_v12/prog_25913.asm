; DESCRIPTION: Renders a green box of size 113x28 starting at (370, 183).
; PLAN: r0=370(x), r1=183(y), r2=113(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 183
LDI r2, 113
LDI r3, 28
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
