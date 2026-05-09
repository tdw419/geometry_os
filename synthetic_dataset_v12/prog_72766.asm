; DESCRIPTION: Draws a red rectangle at (449, 168) with width 51 and height 50.
; PLAN: r0=449(x), r1=168(y), r2=51(width), r3=50(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 168
LDI r2, 51
LDI r3, 50
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
