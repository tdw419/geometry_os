; DESCRIPTION: Renders a cyan box of size 105x75 starting at (7, 81).
; PLAN: r0=7(x), r1=81(y), r2=105(width), r3=75(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 81
LDI r2, 105
LDI r3, 75
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
