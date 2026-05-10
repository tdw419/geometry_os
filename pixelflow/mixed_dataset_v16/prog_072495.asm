; DESCRIPTION: Renders a green box of size 29x79 starting at (18, 166).
; PLAN: r0=18(x), r1=166(y), r2=29(width), r3=79(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 166
LDI r2, 29
LDI r3, 79
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
