; DESCRIPTION: Draws a cyan rectangle at (305, 93) with width 81 and height 98.
; PLAN: r0=305(x), r1=93(y), r2=81(width), r3=98(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 93
LDI r2, 81
LDI r3, 98
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
