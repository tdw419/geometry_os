; DESCRIPTION: Draws a cyan rectangle at (36, 202) with width 100 and height 17.
; PLAN: r0=36(x), r1=202(y), r2=100(width), r3=17(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 202
LDI r2, 100
LDI r3, 17
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
