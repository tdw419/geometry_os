; DESCRIPTION: Draws a cyan rectangle at (82, 187) with width 104 and height 31.
; PLAN: r0=82(x), r1=187(y), r2=104(width), r3=31(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 187
LDI r2, 104
LDI r3, 31
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
