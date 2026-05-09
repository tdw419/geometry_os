; DESCRIPTION: Draws a cyan rectangle at (92, 177) with width 37 and height 75.
; PLAN: r0=92(x), r1=177(y), r2=37(width), r3=75(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 177
LDI r2, 37
LDI r3, 75
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
