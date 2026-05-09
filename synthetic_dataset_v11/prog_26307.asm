; DESCRIPTION: Draws a red rectangle at (16, 47) with width 111 and height 81.
; PLAN: r0=16(x), r1=47(y), r2=111(width), r3=81(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 47
LDI r2, 111
LDI r3, 81
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
