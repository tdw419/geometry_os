; DESCRIPTION: Draws a cyan rectangle at (82, 127) with width 57 and height 116.
; PLAN: r0=82(x), r1=127(y), r2=57(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 127
LDI r2, 57
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
