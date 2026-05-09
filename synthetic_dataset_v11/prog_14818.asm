; DESCRIPTION: Composite: . Then Draws a green rectangle at (16, 127) with width 39 and height 44. Then Places a green dot at position (239, 23).
; PLAN: r0=16(x), r1=127(y), r2=39(width), r3=44(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=239(x), r1=23(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a green rectangle at (16, 127) with width 39 and height 44.
; PLAN: r0=16(x), r1=127(y), r2=39(width), r3=44(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 127
LDI r2, 39
LDI r3, 44
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a green dot at position (239, 23).
; PLAN: r0=239(x), r1=23(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 239
LDI r1, 23
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
