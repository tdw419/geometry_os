; DESCRIPTION: Renders a green box of size 82x13 starting at (247, 18).
; PLAN: r0=247(x), r1=18(y), r2=82(width), r3=13(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 18
LDI r2, 82
LDI r3, 13
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
