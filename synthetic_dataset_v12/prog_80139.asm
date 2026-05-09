; DESCRIPTION: Draws a cyan rectangle at (335, 197) with width 98 and height 47.
; PLAN: r0=335(x), r1=197(y), r2=98(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 197
LDI r2, 98
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
