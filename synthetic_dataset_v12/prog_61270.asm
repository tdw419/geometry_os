; DESCRIPTION: Draws a red rectangle at (406, 137) with width 103 and height 111.
; PLAN: r0=406(x), r1=137(y), r2=103(width), r3=111(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 137
LDI r2, 103
LDI r3, 111
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
