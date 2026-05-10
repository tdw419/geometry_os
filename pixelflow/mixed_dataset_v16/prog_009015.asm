; DESCRIPTION: Draws a cyan rectangle at (276, 7) with width 111 and height 115.
; PLAN: r0=276(x), r1=7(y), r2=111(width), r3=115(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 7
LDI r2, 111
LDI r3, 115
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
