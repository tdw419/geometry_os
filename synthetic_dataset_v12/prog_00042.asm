; DESCRIPTION: Draws a orange rectangle at (277, 117) with width 65 and height 58.
; PLAN: r0=277(x), r1=117(y), r2=65(width), r3=58(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 117
LDI r2, 65
LDI r3, 58
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
