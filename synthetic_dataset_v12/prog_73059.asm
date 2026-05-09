; DESCRIPTION: Draws a cyan rectangle at (201, 7) with width 10 and height 61.
; PLAN: r0=201(x), r1=7(y), r2=10(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 7
LDI r2, 10
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
