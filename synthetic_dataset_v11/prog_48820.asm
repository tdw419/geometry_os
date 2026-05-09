; DESCRIPTION: Composite: . Then Places a green line segment connecting (81, 213) to (32, 13). Then Sets a single purple pixel at (154, 80).
; PLAN: r0=81(x1), r1=213(y1), r2=32(x2), r3=13(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=154(x), r1=80(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a green line segment connecting (81, 213) to (32, 13).
; PLAN: r0=81(x1), r1=213(y1), r2=32(x2), r3=13(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 213
LDI r2, 32
LDI r3, 13
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single purple pixel at (154, 80).
; PLAN: r0=154(x), r1=80(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 154
LDI r1, 80
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
