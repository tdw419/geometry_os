; DESCRIPTION: Composite: . Then Places a magenta dot at position (168, 250). Then Renders a magenta box of size 50x94 starting at (76, 123).
; PLAN: r0=168(x), r1=250(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=76(x), r1=123(y), r2=50(width), r3=94(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta dot at position (168, 250).
; PLAN: r0=168(x), r1=250(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 168
LDI r1, 250
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Renders a magenta box of size 50x94 starting at (76, 123).
; PLAN: r0=76(x), r1=123(y), r2=50(width), r3=94(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 123
LDI r2, 50
LDI r3, 94
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
