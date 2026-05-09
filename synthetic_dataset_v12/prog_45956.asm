; DESCRIPTION: Draws a cyan rectangle at (34, 79) with width 24 and height 111.
; PLAN: r0=34(x), r1=79(y), r2=24(width), r3=111(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 79
LDI r2, 24
LDI r3, 111
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
