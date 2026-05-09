; DESCRIPTION: Draws a cyan rectangle at (129, 131) with width 95 and height 60.
; PLAN: r0=129(x), r1=131(y), r2=95(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 131
LDI r2, 95
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
