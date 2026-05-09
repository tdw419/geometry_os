; DESCRIPTION: Draws a cyan rectangle at (322, 210) with width 36 and height 46.
; PLAN: r0=322(x), r1=210(y), r2=36(width), r3=46(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 210
LDI r2, 36
LDI r3, 46
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
