; DESCRIPTION: Composite: . Then Sets a single yellow pixel at (149, 12). Then Renders a cyan box of size 96x30 starting at (121, 89).
; PLAN: r0=149(x), r1=12(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=121(x), r1=89(y), r2=96(width), r3=30(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single yellow pixel at (149, 12).
; PLAN: r0=149(x), r1=12(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 149
LDI r1, 12
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Renders a cyan box of size 96x30 starting at (121, 89).
; PLAN: r0=121(x), r1=89(y), r2=96(width), r3=30(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 89
LDI r2, 96
LDI r3, 30
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
