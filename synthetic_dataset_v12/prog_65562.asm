; DESCRIPTION: Draws a cyan rectangle at (210, 133) with width 57 and height 38.
; PLAN: r0=210(x), r1=133(y), r2=57(width), r3=38(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 133
LDI r2, 57
LDI r3, 38
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
