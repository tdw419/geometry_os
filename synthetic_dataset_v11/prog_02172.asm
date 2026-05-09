; DESCRIPTION: Composite: . Then Places a red dot at position (191, 89). Then Renders a green box of size 82x65 starting at (132, 6).
; PLAN: r0=191(x), r1=89(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=132(x), r1=6(y), r2=82(width), r3=65(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red dot at position (191, 89).
; PLAN: r0=191(x), r1=89(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 191
LDI r1, 89
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Renders a green box of size 82x65 starting at (132, 6).
; PLAN: r0=132(x), r1=6(y), r2=82(width), r3=65(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 6
LDI r2, 82
LDI r3, 65
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
