; DESCRIPTION: Draws a cyan rectangle at (81, 59) with width 111 and height 87.
; PLAN: r0=81(x), r1=59(y), r2=111(width), r3=87(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 59
LDI r2, 111
LDI r3, 87
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
