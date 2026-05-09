; DESCRIPTION: Composite: . Then Sets a single purple pixel at (168, 142). Then Renders a cyan box of size 103x25 starting at (104, 44).
; PLAN: r0=168(x), r1=142(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=104(x), r1=44(y), r2=103(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single purple pixel at (168, 142).
; PLAN: r0=168(x), r1=142(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 168
LDI r1, 142
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Renders a cyan box of size 103x25 starting at (104, 44).
; PLAN: r0=104(x), r1=44(y), r2=103(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 44
LDI r2, 103
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
