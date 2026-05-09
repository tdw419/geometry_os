; DESCRIPTION: Composite: . Then Draws a cyan rectangle at (62, 22) with width 94 and height 78. Then Places a black dot at position (236, 154).
; PLAN: r0=62(x), r1=22(y), r2=94(width), r3=78(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=236(x), r1=154(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a cyan rectangle at (62, 22) with width 94 and height 78.
; PLAN: r0=62(x), r1=22(y), r2=94(width), r3=78(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 22
LDI r2, 94
LDI r3, 78
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a black dot at position (236, 154).
; PLAN: r0=236(x), r1=154(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 236
LDI r1, 154
LDI r2, 0x000000
PSET r0, r1, r2
HALT
