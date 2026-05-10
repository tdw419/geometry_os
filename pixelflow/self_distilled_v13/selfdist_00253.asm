; DESCRIPTION: Draws a red rectangle at (221, 93) with width 33 and height 31.
; PLAN: r0=221(x), r1=93(y), r2=33(width), r3=31(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 93
LDI r2, 33
LDI r3, 31
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
