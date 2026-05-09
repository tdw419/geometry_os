; DESCRIPTION: Composite: . Then Sets a single purple pixel at (80, 13). Then Renders a green box of size 62x32 starting at (149, 5).
; PLAN: r0=80(x), r1=13(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=149(x), r1=5(y), r2=62(width), r3=32(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single purple pixel at (80, 13).
; PLAN: r0=80(x), r1=13(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 80
LDI r1, 13
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Renders a green box of size 62x32 starting at (149, 5).
; PLAN: r0=149(x), r1=5(y), r2=62(width), r3=32(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 5
LDI r2, 62
LDI r3, 32
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
