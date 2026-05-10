; DESCRIPTION: Draws a cyan rectangle at (387, 75) with width 59 and height 82.
; PLAN: r0=387(x), r1=75(y), r2=59(width), r3=82(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 75
LDI r2, 59
LDI r3, 82
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
