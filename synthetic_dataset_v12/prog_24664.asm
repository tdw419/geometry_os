; DESCRIPTION: Draws a cyan rectangle at (178, 48) with width 27 and height 91.
; PLAN: r0=178(x), r1=48(y), r2=27(width), r3=91(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 48
LDI r2, 27
LDI r3, 91
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
