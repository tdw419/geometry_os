; DESCRIPTION: Draws a cyan rectangle at (446, 142) with width 56 and height 68.
; PLAN: r0=446(x), r1=142(y), r2=56(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 142
LDI r2, 56
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
