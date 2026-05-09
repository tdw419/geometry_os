; DESCRIPTION: Composite: . Then Places a yellow dot at position (105, 99). Then Renders a magenta box of size 48x37 starting at (119, 113).
; PLAN: r0=105(x), r1=99(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=119(x), r1=113(y), r2=48(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow dot at position (105, 99).
; PLAN: r0=105(x), r1=99(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 105
LDI r1, 99
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Renders a magenta box of size 48x37 starting at (119, 113).
; PLAN: r0=119(x), r1=113(y), r2=48(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 113
LDI r2, 48
LDI r3, 37
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
