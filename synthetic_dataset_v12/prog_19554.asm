; DESCRIPTION: Draws a cyan rectangle at (0, 34) with width 111 and height 47.
; PLAN: r0=0(x), r1=34(y), r2=111(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 34
LDI r2, 111
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
