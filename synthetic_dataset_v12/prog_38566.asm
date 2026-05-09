; DESCRIPTION: Draws a cyan rectangle at (335, 112) with width 93 and height 102.
; PLAN: r0=335(x), r1=112(y), r2=93(width), r3=102(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 112
LDI r2, 93
LDI r3, 102
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
