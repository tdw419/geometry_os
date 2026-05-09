; DESCRIPTION: Composite: . Then Renders a white box of size 27x65 starting at (60, 43). Then Places a magenta dot at position (49, 52).
; PLAN: r0=60(x), r1=43(y), r2=27(width), r3=65(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=49(x), r1=52(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a white box of size 27x65 starting at (60, 43).
; PLAN: r0=60(x), r1=43(y), r2=27(width), r3=65(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 43
LDI r2, 27
LDI r3, 65
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta dot at position (49, 52).
; PLAN: r0=49(x), r1=52(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 49
LDI r1, 52
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
