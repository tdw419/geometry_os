; DESCRIPTION: Composite: . Then Sets a single orange pixel at (240, 183). Then Places a white 41x47 rectangle at position (45, 146).
; PLAN: r0=240(x), r1=183(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=45(x), r1=146(y), r2=41(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single orange pixel at (240, 183).
; PLAN: r0=240(x), r1=183(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 240
LDI r1, 183
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Places a white 41x47 rectangle at position (45, 146).
; PLAN: r0=45(x), r1=146(y), r2=41(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 146
LDI r2, 41
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
