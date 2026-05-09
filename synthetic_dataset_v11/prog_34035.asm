; DESCRIPTION: Draws a cyan rectangle at (109, 68) with width 93 and height 120.
; PLAN: r0=109(x), r1=68(y), r2=93(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 68
LDI r2, 93
LDI r3, 120
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
