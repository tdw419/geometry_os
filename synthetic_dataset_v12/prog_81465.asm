; DESCRIPTION: Draws a cyan rectangle at (367, 144) with width 107 and height 112.
; PLAN: r0=367(x), r1=144(y), r2=107(width), r3=112(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 144
LDI r2, 107
LDI r3, 112
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
