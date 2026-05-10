; DESCRIPTION: Draws a red rectangle at (111, 146) with width 53 and height 91.
; PLAN: r0=111(x), r1=146(y), r2=53(width), r3=91(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 146
LDI r2, 53
LDI r3, 91
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
