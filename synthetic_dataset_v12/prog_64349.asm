; DESCRIPTION: Draws a yellow rectangle at (200, 215) with width 91 and height 27.
; PLAN: r0=200(x), r1=215(y), r2=91(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 215
LDI r2, 91
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
