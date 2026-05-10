; DESCRIPTION: Draws a cyan rectangle at (193, 51) with width 16 and height 103.
; PLAN: r0=193(x), r1=51(y), r2=16(width), r3=103(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 51
LDI r2, 16
LDI r3, 103
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
