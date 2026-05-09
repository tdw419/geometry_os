; DESCRIPTION: Composite: . Then Places a yellow dot at position (113, 199). Then Places a white 95x111 rectangle at position (91, 45).
; PLAN: r0=113(x), r1=199(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=91(x), r1=45(y), r2=95(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow dot at position (113, 199).
; PLAN: r0=113(x), r1=199(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 113
LDI r1, 199
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Places a white 95x111 rectangle at position (91, 45).
; PLAN: r0=91(x), r1=45(y), r2=95(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 45
LDI r2, 95
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
