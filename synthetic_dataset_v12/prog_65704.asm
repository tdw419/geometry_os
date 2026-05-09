; DESCRIPTION: Renders a cyan box of size 99x29 starting at (13, 122).
; PLAN: r0=13(x), r1=122(y), r2=99(width), r3=29(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 122
LDI r2, 99
LDI r3, 29
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
