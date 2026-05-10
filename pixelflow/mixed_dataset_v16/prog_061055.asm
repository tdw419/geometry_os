; DESCRIPTION: Draws a cyan rectangle at (189, 111) with width 56 and height 45.
; PLAN: r0=189(x), r1=111(y), r2=56(width), r3=45(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 111
LDI r2, 56
LDI r3, 45
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
