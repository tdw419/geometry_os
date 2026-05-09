; DESCRIPTION: Draws a cyan rectangle at (171, 144) with width 82 and height 80.
; PLAN: r0=171(x), r1=144(y), r2=82(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 144
LDI r2, 82
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
