; DESCRIPTION: Draws a cyan rectangle at (346, 45) with width 56 and height 102.
; PLAN: r0=346(x), r1=45(y), r2=56(width), r3=102(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 45
LDI r2, 56
LDI r3, 102
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
