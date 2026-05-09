; DESCRIPTION: Draws a cyan rectangle at (340, 199) with width 16 and height 57.
; PLAN: r0=340(x), r1=199(y), r2=16(width), r3=57(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 199
LDI r2, 16
LDI r3, 57
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
