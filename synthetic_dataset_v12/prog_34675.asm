; DESCRIPTION: Draws a cyan rectangle at (62, 107) with width 91 and height 111.
; PLAN: r0=62(x), r1=107(y), r2=91(width), r3=111(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 107
LDI r2, 91
LDI r3, 111
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
