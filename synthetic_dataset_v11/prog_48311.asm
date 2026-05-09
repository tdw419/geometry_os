; DESCRIPTION: Composite: . Then Places a blue dot at position (50, 30). Then Places a green 20x86 rectangle at position (215, 129).
; PLAN: r0=50(x), r1=30(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=215(x), r1=129(y), r2=20(width), r3=86(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue dot at position (50, 30).
; PLAN: r0=50(x), r1=30(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 50
LDI r1, 30
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Places a green 20x86 rectangle at position (215, 129).
; PLAN: r0=215(x), r1=129(y), r2=20(width), r3=86(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 129
LDI r2, 20
LDI r3, 86
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
