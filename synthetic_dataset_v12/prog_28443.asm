; DESCRIPTION: Draws a cyan rectangle at (445, 201) with width 64 and height 26.
; PLAN: r0=445(x), r1=201(y), r2=64(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 201
LDI r2, 64
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
