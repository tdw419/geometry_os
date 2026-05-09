; DESCRIPTION: Draws a cyan rectangle at (281, 126) with width 92 and height 37.
; PLAN: r0=281(x), r1=126(y), r2=92(width), r3=37(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 126
LDI r2, 92
LDI r3, 37
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
