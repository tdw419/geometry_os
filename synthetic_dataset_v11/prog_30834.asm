; DESCRIPTION: Composite: . Then Places a blue 104x32 rectangle at position (10, 117). Then Sets a single green pixel at (140, 229).
; PLAN: r0=10(x), r1=117(y), r2=104(width), r3=32(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=140(x), r1=229(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a blue 104x32 rectangle at position (10, 117).
; PLAN: r0=10(x), r1=117(y), r2=104(width), r3=32(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 117
LDI r2, 104
LDI r3, 32
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single green pixel at (140, 229).
; PLAN: r0=140(x), r1=229(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 140
LDI r1, 229
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
