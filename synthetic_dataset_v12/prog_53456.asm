; DESCRIPTION: Renders a cyan box of size 77x97 starting at (11, 9).
; PLAN: r0=11(x), r1=9(y), r2=77(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 9
LDI r2, 77
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
