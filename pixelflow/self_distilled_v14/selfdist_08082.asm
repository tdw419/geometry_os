; DESCRIPTION: Fills the screen with magenta then draws a green rectangle at (100, 80) with size 100x50.
; PLAN: r0=100(x), r1=80(y), r2=100(width), r3=50(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 80
LDI r2, 100
LDI r3, 50
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
