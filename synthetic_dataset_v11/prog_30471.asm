; DESCRIPTION: Composite: . Then Renders a blue disk with center (74, 135) and radius 48. Then Places a blue dot at position (234, 228).
; PLAN: r0=74(x), r1=135(y), r2=48(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=234(x), r1=228(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a blue disk with center (74, 135) and radius 48.
; PLAN: r0=74(x), r1=135(y), r2=48(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 135
LDI r2, 48
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a blue dot at position (234, 228).
; PLAN: r0=234(x), r1=228(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 234
LDI r1, 228
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
