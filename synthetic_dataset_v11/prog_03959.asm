; DESCRIPTION: Composite: . Then Places a green dot at position (98, 231). Then Draws a white rectangle at (9, 110) with width 39 and height 95.
; PLAN: r0=98(x), r1=231(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=9(x), r1=110(y), r2=39(width), r3=95(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green dot at position (98, 231).
; PLAN: r0=98(x), r1=231(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 98
LDI r1, 231
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Draws a white rectangle at (9, 110) with width 39 and height 95.
; PLAN: r0=9(x), r1=110(y), r2=39(width), r3=95(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 110
LDI r2, 39
LDI r3, 95
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
