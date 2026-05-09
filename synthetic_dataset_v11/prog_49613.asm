; DESCRIPTION: Composite: . Then Places a red dot at position (244, 202). Then Draws a magenta rectangle at (145, 44) with width 91 and height 78.
; PLAN: r0=244(x), r1=202(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=145(x), r1=44(y), r2=91(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red dot at position (244, 202).
; PLAN: r0=244(x), r1=202(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 244
LDI r1, 202
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Draws a magenta rectangle at (145, 44) with width 91 and height 78.
; PLAN: r0=145(x), r1=44(y), r2=91(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 44
LDI r2, 91
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
