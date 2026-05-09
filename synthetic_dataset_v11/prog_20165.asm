; DESCRIPTION: Renders a green box of size 42x39 starting at (149, 130).
; PLAN: r0=149(x), r1=130(y), r2=42(width), r3=39(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 130
LDI r2, 42
LDI r3, 39
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
