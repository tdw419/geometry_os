; DESCRIPTION: Draws a cyan rectangle at (69, 177) with width 93 and height 50.
; PLAN: r0=69(x), r1=177(y), r2=93(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 177
LDI r2, 93
LDI r3, 50
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
