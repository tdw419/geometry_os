; DESCRIPTION: Draws a cyan rectangle at (380, 234) with width 107 and height 21.
; PLAN: r0=380(x), r1=234(y), r2=107(width), r3=21(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 234
LDI r2, 107
LDI r3, 21
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
