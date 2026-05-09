; DESCRIPTION: Draws a cyan rectangle at (133, 60) with width 54 and height 103.
; PLAN: r0=133(x), r1=60(y), r2=54(width), r3=103(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 60
LDI r2, 54
LDI r3, 103
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
