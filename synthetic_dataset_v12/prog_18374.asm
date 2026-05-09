; DESCRIPTION: Draws a yellow rectangle at (410, 103) with width 82 and height 90.
; PLAN: r0=410(x), r1=103(y), r2=82(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 103
LDI r2, 82
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
