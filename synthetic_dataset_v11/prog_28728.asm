; DESCRIPTION: Composite: . Then Places a cyan 50x24 rectangle at position (193, 96). Then Sets a single red pixel at (147, 85).
; PLAN: r0=193(x), r1=96(y), r2=50(width), r3=24(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=147(x), r1=85(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a cyan 50x24 rectangle at position (193, 96).
; PLAN: r0=193(x), r1=96(y), r2=50(width), r3=24(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 96
LDI r2, 50
LDI r3, 24
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single red pixel at (147, 85).
; PLAN: r0=147(x), r1=85(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 147
LDI r1, 85
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
