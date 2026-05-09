; DESCRIPTION: Draws a cyan rectangle at (170, 126) with width 77 and height 20.
; PLAN: r0=170(x), r1=126(y), r2=77(width), r3=20(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 126
LDI r2, 77
LDI r3, 20
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
