; DESCRIPTION: Draws a green rectangle at (445, 58) with width 50 and height 10.
; PLAN: r0=445(x), r1=58(y), r2=50(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 58
LDI r2, 50
LDI r3, 10
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
