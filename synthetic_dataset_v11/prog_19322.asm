; DESCRIPTION: Draws a cyan rectangle at (193, 179) with width 10 and height 30.
; PLAN: r0=193(x), r1=179(y), r2=10(width), r3=30(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 179
LDI r2, 10
LDI r3, 30
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
