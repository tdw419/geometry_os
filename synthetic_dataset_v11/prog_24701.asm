; DESCRIPTION: Composite: . Then Places a orange dot at position (133, 46). Then Draws a red rectangle at (128, 60) with width 44 and height 103.
; PLAN: r0=133(x), r1=46(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=128(x), r1=60(y), r2=44(width), r3=103(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange dot at position (133, 46).
; PLAN: r0=133(x), r1=46(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 133
LDI r1, 46
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Draws a red rectangle at (128, 60) with width 44 and height 103.
; PLAN: r0=128(x), r1=60(y), r2=44(width), r3=103(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 60
LDI r2, 44
LDI r3, 103
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
