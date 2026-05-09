; DESCRIPTION: Composite: . Then Places a purple 40x91 rectangle at position (48, 103). Then Sets a single black pixel at (92, 167).
; PLAN: r0=48(x), r1=103(y), r2=40(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=92(x), r1=167(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a purple 40x91 rectangle at position (48, 103).
; PLAN: r0=48(x), r1=103(y), r2=40(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 103
LDI r2, 40
LDI r3, 91
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single black pixel at (92, 167).
; PLAN: r0=92(x), r1=167(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 92
LDI r1, 167
LDI r2, 0x000000
PSET r0, r1, r2
HALT
