; DESCRIPTION: Draws a cyan rectangle at (411, 93) with width 36 and height 100.
; PLAN: r0=411(x), r1=93(y), r2=36(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 93
LDI r2, 36
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
