; DESCRIPTION: Renders a green box of size 103x66 starting at (49, 83).
; PLAN: r0=49(x), r1=83(y), r2=103(width), r3=66(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 83
LDI r2, 103
LDI r3, 66
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
