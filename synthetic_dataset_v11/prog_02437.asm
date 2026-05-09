; DESCRIPTION: Renders a black box of size 13x33 starting at (176, 134).
; PLAN: r0=176(x), r1=134(y), r2=13(width), r3=33(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 134
LDI r2, 13
LDI r3, 33
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
