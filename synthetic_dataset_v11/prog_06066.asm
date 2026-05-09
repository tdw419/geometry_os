; DESCRIPTION: Draws a cyan rectangle at (173, 33) with width 11 and height 33.
; PLAN: r0=173(x), r1=33(y), r2=11(width), r3=33(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 33
LDI r2, 11
LDI r3, 33
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
