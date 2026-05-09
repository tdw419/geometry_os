; DESCRIPTION: Renders a green box of size 82x26 starting at (70, 4).
; PLAN: r0=70(x), r1=4(y), r2=82(width), r3=26(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 4
LDI r2, 82
LDI r3, 26
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
