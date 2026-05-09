; DESCRIPTION: Draws a red rectangle at (202, 201) with width 92 and height 16.
; PLAN: r0=202(x), r1=201(y), r2=92(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 201
LDI r2, 92
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
