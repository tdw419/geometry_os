; DESCRIPTION: Draws a red rectangle at (187, 134) with width 38 and height 48.
; PLAN: r0=187(x), r1=134(y), r2=38(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 134
LDI r2, 38
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
