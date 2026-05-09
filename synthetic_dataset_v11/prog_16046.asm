; DESCRIPTION: Draws a yellow rectangle at (150, 47) with width 64 and height 58.
; PLAN: r0=150(x), r1=47(y), r2=64(width), r3=58(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 47
LDI r2, 64
LDI r3, 58
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
