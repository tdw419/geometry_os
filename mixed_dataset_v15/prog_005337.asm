; DESCRIPTION: Draws a cyan rectangle at (380, 18) with width 48 and height 44.
; PLAN: r0=380(x), r1=18(y), r2=48(width), r3=44(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 18
LDI r2, 48
LDI r3, 44
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
