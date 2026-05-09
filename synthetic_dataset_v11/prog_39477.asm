; DESCRIPTION: Composite: . Then Places a magenta dot at position (71, 44). Then Renders a green box of size 54x76 starting at (193, 112).
; PLAN: r0=71(x), r1=44(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=193(x), r1=112(y), r2=54(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta dot at position (71, 44).
; PLAN: r0=71(x), r1=44(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 71
LDI r1, 44
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Renders a green box of size 54x76 starting at (193, 112).
; PLAN: r0=193(x), r1=112(y), r2=54(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 112
LDI r2, 54
LDI r3, 76
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
