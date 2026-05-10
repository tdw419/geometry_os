; DESCRIPTION: Draws a red rectangle at (372, 187) with width 21 and height 10.
; PLAN: r0=372(x), r1=187(y), r2=21(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 187
LDI r2, 21
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
