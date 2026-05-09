; DESCRIPTION: Renders a green box of size 25x15 starting at (183, 221).
; PLAN: r0=183(x), r1=221(y), r2=25(width), r3=15(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 221
LDI r2, 25
LDI r3, 15
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
