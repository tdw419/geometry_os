; DESCRIPTION: Renders a green box of size 103x119 starting at (36, 37).
; PLAN: r0=36(x), r1=37(y), r2=103(width), r3=119(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 37
LDI r2, 103
LDI r3, 119
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
