; DESCRIPTION: Draws a cyan rectangle at (76, 71) with width 61 and height 87.
; PLAN: r0=76(x), r1=71(y), r2=61(width), r3=87(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 71
LDI r2, 61
LDI r3, 87
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
