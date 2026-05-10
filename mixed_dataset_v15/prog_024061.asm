; DESCRIPTION: Draws a cyan rectangle at (279, 126) with width 61 and height 71.
; PLAN: r0=279(x), r1=126(y), r2=61(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 126
LDI r2, 61
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
