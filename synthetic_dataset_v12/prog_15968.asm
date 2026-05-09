; DESCRIPTION: Draws a green rectangle at (386, 162) with width 16 and height 27.
; PLAN: r0=386(x), r1=162(y), r2=16(width), r3=27(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 162
LDI r2, 16
LDI r3, 27
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
