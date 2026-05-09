; DESCRIPTION: Composite: . Then Places a cyan dot at position (158, 71). Then Places a yellow 69x15 rectangle at position (51, 184).
; PLAN: r0=158(x), r1=71(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=51(x), r1=184(y), r2=69(width), r3=15(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan dot at position (158, 71).
; PLAN: r0=158(x), r1=71(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 158
LDI r1, 71
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Places a yellow 69x15 rectangle at position (51, 184).
; PLAN: r0=51(x), r1=184(y), r2=69(width), r3=15(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 184
LDI r2, 69
LDI r3, 15
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
