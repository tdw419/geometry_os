; DESCRIPTION: Renders a green box of size 23x82 starting at (82, 75).
; PLAN: r0=82(x), r1=75(y), r2=23(width), r3=82(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 75
LDI r2, 23
LDI r3, 82
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
