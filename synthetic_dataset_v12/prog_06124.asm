; DESCRIPTION: Renders a yellow box of size 13x105 starting at (128, 91).
; PLAN: r0=128(x), r1=91(y), r2=13(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 91
LDI r2, 13
LDI r3, 105
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
