; DESCRIPTION: Composite: . Then Places a cyan 62x103 rectangle at position (11, 82). Then Sets a single magenta pixel at (253, 194).
; PLAN: r0=11(x), r1=82(y), r2=62(width), r3=103(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=253(x), r1=194(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a cyan 62x103 rectangle at position (11, 82).
; PLAN: r0=11(x), r1=82(y), r2=62(width), r3=103(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 82
LDI r2, 62
LDI r3, 103
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single magenta pixel at (253, 194).
; PLAN: r0=253(x), r1=194(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 253
LDI r1, 194
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
