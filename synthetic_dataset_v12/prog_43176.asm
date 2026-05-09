; DESCRIPTION: Draws a cyan rectangle at (402, 30) with width 60 and height 61.
; PLAN: r0=402(x), r1=30(y), r2=60(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 30
LDI r2, 60
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
