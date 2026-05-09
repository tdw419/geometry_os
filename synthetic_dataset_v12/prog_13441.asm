; DESCRIPTION: Draws a cyan rectangle at (239, 99) with width 23 and height 48.
; PLAN: r0=239(x), r1=99(y), r2=23(width), r3=48(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 99
LDI r2, 23
LDI r3, 48
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
