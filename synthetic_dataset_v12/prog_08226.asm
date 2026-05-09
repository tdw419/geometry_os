; DESCRIPTION: Renders a green box of size 42x25 starting at (125, 205).
; PLAN: r0=125(x), r1=205(y), r2=42(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 205
LDI r2, 42
LDI r3, 25
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
