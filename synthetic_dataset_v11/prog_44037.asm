; DESCRIPTION: Composite: . Then Places a green dot at position (81, 228). Then Renders a red disk with center (134, 121) and radius 58.
; PLAN: r0=81(x), r1=228(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=134(x), r1=121(y), r2=58(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a green dot at position (81, 228).
; PLAN: r0=81(x), r1=228(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 81
LDI r1, 228
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Renders a red disk with center (134, 121) and radius 58.
; PLAN: r0=134(x), r1=121(y), r2=58(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 121
LDI r2, 58
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
