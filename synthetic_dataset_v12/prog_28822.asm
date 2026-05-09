; DESCRIPTION: Renders a cyan box of size 69x110 starting at (13, 77).
; PLAN: r0=13(x), r1=77(y), r2=69(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 77
LDI r2, 69
LDI r3, 110
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
