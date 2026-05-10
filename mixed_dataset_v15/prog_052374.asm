; DESCRIPTION: Renders a white box of size 49x11 starting at (195, 213).
; PLAN: r0=195(x), r1=213(y), r2=49(width), r3=11(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 213
LDI r2, 49
LDI r3, 11
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
