; DESCRIPTION: Composite: . Then Places a red dot at position (255, 91). Then Renders a purple box of size 109x113 starting at (96, 132).
; PLAN: r0=255(x), r1=91(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=96(x), r1=132(y), r2=109(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red dot at position (255, 91).
; PLAN: r0=255(x), r1=91(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 255
LDI r1, 91
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Renders a purple box of size 109x113 starting at (96, 132).
; PLAN: r0=96(x), r1=132(y), r2=109(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 132
LDI r2, 109
LDI r3, 113
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
