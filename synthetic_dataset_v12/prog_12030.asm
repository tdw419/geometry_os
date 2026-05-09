; DESCRIPTION: Draws a cyan rectangle at (48, 98) with width 34 and height 66.
; PLAN: r0=48(x), r1=98(y), r2=34(width), r3=66(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 98
LDI r2, 34
LDI r3, 66
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
