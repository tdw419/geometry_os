; DESCRIPTION: Composite: . Then Places a red 10x46 rectangle at position (42, 170). Then Sets a single orange pixel at (111, 133).
; PLAN: r0=42(x), r1=170(y), r2=10(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=111(x), r1=133(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a red 10x46 rectangle at position (42, 170).
; PLAN: r0=42(x), r1=170(y), r2=10(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 170
LDI r2, 10
LDI r3, 46
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single orange pixel at (111, 133).
; PLAN: r0=111(x), r1=133(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 111
LDI r1, 133
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
