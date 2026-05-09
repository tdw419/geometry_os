; DESCRIPTION: Draws a cyan rectangle at (392, 46) with width 56 and height 51.
; PLAN: r0=392(x), r1=46(y), r2=56(width), r3=51(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 46
LDI r2, 56
LDI r3, 51
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
