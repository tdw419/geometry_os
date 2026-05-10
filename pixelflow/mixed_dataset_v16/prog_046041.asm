; DESCRIPTION: Renders a green box of size 32x17 starting at (306, 221).
; PLAN: r0=306(x), r1=221(y), r2=32(width), r3=17(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 221
LDI r2, 32
LDI r3, 17
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
