; DESCRIPTION: Composite: Sets a single magenta pixel at (410, 24) then Renders a cyan box of size 14x93 starting at (53, 7).
; PLAN: r0=410(x), r1=24(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=53(x), r6=7(y), r7=14(width), r8=93(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 410
LDI r1, 24
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 53
LDI r6, 7
LDI r7, 14
LDI r8, 93
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
