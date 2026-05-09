; DESCRIPTION: Draws a cyan rectangle at (392, 151) with width 76 and height 47.
; PLAN: r0=392(x), r1=151(y), r2=76(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 151
LDI r2, 76
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
