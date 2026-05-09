; DESCRIPTION: Renders a cyan box of size 110x40 starting at (117, 122).
; PLAN: r0=117(x), r1=122(y), r2=110(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 122
LDI r2, 110
LDI r3, 40
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
