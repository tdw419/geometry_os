; DESCRIPTION: Draws a red rectangle at (45, 220) with width 91 and height 16.
; PLAN: r0=45(x), r1=220(y), r2=91(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 220
LDI r2, 91
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
