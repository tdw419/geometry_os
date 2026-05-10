; DESCRIPTION: Draws a cyan rectangle at (368, 40) with width 27 and height 119.
; PLAN: r0=368(x), r1=40(y), r2=27(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 40
LDI r2, 27
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
