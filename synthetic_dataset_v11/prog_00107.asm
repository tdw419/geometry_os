; DESCRIPTION: Draws a cyan rectangle at (40, 117) with width 61 and height 103.
; PLAN: r0=40(x), r1=117(y), r2=61(width), r3=103(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 117
LDI r2, 61
LDI r3, 103
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
