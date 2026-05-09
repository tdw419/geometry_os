; DESCRIPTION: Draws a cyan rectangle at (61, 112) with width 77 and height 37.
; PLAN: r0=61(x), r1=112(y), r2=77(width), r3=37(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 112
LDI r2, 77
LDI r3, 37
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
