; DESCRIPTION: Composite: . Then Sets a single green pixel at (168, 232). Then Places a yellow 24x111 rectangle at position (8, 1).
; PLAN: r0=168(x), r1=232(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=8(x), r1=1(y), r2=24(width), r3=111(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single green pixel at (168, 232).
; PLAN: r0=168(x), r1=232(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 168
LDI r1, 232
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Places a yellow 24x111 rectangle at position (8, 1).
; PLAN: r0=8(x), r1=1(y), r2=24(width), r3=111(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 1
LDI r2, 24
LDI r3, 111
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
