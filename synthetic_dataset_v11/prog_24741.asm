; DESCRIPTION: Composite: . Then Places a yellow dot at position (106, 198). Then Renders a green box of size 58x46 starting at (120, 75).
; PLAN: r0=106(x), r1=198(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=120(x), r1=75(y), r2=58(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow dot at position (106, 198).
; PLAN: r0=106(x), r1=198(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 106
LDI r1, 198
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Renders a green box of size 58x46 starting at (120, 75).
; PLAN: r0=120(x), r1=75(y), r2=58(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 75
LDI r2, 58
LDI r3, 46
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
