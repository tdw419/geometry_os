; DESCRIPTION: Draws a cyan rectangle at (13, 182) with width 94 and height 58.
; PLAN: r0=13(x), r1=182(y), r2=94(width), r3=58(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 182
LDI r2, 94
LDI r3, 58
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
