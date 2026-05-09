; DESCRIPTION: Draws a red rectangle at (259, 47) with width 37 and height 48.
; PLAN: r0=259(x), r1=47(y), r2=37(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 47
LDI r2, 37
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
