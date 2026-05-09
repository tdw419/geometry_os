; DESCRIPTION: Composite: . Then Places a magenta dot at position (63, 60). Then Renders a magenta disk with center (202, 172) and radius 48.
; PLAN: r0=63(x), r1=60(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=202(x), r1=172(y), r2=48(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a magenta dot at position (63, 60).
; PLAN: r0=63(x), r1=60(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 63
LDI r1, 60
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Renders a magenta disk with center (202, 172) and radius 48.
; PLAN: r0=202(x), r1=172(y), r2=48(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 202
LDI r1, 172
LDI r2, 48
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
