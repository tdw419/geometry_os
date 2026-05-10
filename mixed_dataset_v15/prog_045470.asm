; DESCRIPTION: Draws a red rectangle at (140, 48) with width 46 and height 95.
; PLAN: r0=140(x), r1=48(y), r2=46(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 48
LDI r2, 46
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
