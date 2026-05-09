; DESCRIPTION: Composite: . Then Sets a single cyan pixel at (86, 205). Then Places a red 41x85 rectangle at position (149, 159).
; PLAN: r0=86(x), r1=205(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=149(x), r1=159(y), r2=41(width), r3=85(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single cyan pixel at (86, 205).
; PLAN: r0=86(x), r1=205(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 86
LDI r1, 205
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Places a red 41x85 rectangle at position (149, 159).
; PLAN: r0=149(x), r1=159(y), r2=41(width), r3=85(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 159
LDI r2, 41
LDI r3, 85
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
