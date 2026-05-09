; DESCRIPTION: Composite: . Then Renders a magenta box of size 103x76 starting at (97, 159). Then Places a black dot at position (198, 101).
; PLAN: r0=97(x), r1=159(y), r2=103(width), r3=76(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=198(x), r1=101(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a magenta box of size 103x76 starting at (97, 159).
; PLAN: r0=97(x), r1=159(y), r2=103(width), r3=76(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 159
LDI r2, 103
LDI r3, 76
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a black dot at position (198, 101).
; PLAN: r0=198(x), r1=101(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 198
LDI r1, 101
LDI r2, 0x000000
PSET r0, r1, r2
HALT
