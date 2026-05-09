; DESCRIPTION: Draws a cyan rectangle at (293, 133) with width 76 and height 69.
; PLAN: r0=293(x), r1=133(y), r2=76(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 133
LDI r2, 76
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
