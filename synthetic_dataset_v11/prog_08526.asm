; DESCRIPTION: Draws a cyan rectangle at (132, 214) with width 48 and height 32.
; PLAN: r0=132(x), r1=214(y), r2=48(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 214
LDI r2, 48
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
