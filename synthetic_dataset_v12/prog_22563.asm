; DESCRIPTION: Draws a cyan rectangle at (349, 112) with width 36 and height 32.
; PLAN: r0=349(x), r1=112(y), r2=36(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 112
LDI r2, 36
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
