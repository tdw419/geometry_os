; DESCRIPTION: Draws a red rectangle at (277, 244) with width 45 and height 12.
; PLAN: r0=277(x), r1=244(y), r2=45(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 244
LDI r2, 45
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
