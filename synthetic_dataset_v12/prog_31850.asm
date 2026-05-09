; DESCRIPTION: Draws a cyan rectangle at (435, 112) with width 60 and height 97.
; PLAN: r0=435(x), r1=112(y), r2=60(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 112
LDI r2, 60
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
