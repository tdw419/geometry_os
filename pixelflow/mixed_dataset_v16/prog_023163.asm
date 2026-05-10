; DESCRIPTION: Draws a red rectangle at (391, 112) with width 57 and height 95.
; PLAN: r0=391(x), r1=112(y), r2=57(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 112
LDI r2, 57
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
