; DESCRIPTION: Draws a cyan rectangle at (341, 151) with width 50 and height 96.
; PLAN: r0=341(x), r1=151(y), r2=50(width), r3=96(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 151
LDI r2, 50
LDI r3, 96
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
