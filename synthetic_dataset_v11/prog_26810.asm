; DESCRIPTION: Composite: . Then Sets a single orange pixel at (82, 242). Then Places a green 68x53 rectangle at position (41, 7).
; PLAN: r0=82(x), r1=242(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=41(x), r1=7(y), r2=68(width), r3=53(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single orange pixel at (82, 242).
; PLAN: r0=82(x), r1=242(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 82
LDI r1, 242
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Places a green 68x53 rectangle at position (41, 7).
; PLAN: r0=41(x), r1=7(y), r2=68(width), r3=53(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 7
LDI r2, 68
LDI r3, 53
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
