; DESCRIPTION: Draws a cyan rectangle at (50, 53) with width 92 and height 65.
; PLAN: r0=50(x), r1=53(y), r2=92(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 53
LDI r2, 92
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
