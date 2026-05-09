; DESCRIPTION: Renders a green box of size 13x97 starting at (245, 134).
; PLAN: r0=245(x), r1=134(y), r2=13(width), r3=97(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 134
LDI r2, 13
LDI r3, 97
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
