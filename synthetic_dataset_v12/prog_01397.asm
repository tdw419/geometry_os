; DESCRIPTION: Draws a cyan rectangle at (160, 168) with width 103 and height 87.
; PLAN: r0=160(x), r1=168(y), r2=103(width), r3=87(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 168
LDI r2, 103
LDI r3, 87
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
