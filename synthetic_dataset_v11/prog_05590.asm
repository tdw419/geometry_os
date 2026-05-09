; DESCRIPTION: Draws a cyan rectangle at (124, 93) with width 73 and height 47.
; PLAN: r0=124(x), r1=93(y), r2=73(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 93
LDI r2, 73
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
