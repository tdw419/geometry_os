; DESCRIPTION: Draws a cyan rectangle at (221, 82) with width 116 and height 66.
; PLAN: r0=221(x), r1=82(y), r2=116(width), r3=66(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 82
LDI r2, 116
LDI r3, 66
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
