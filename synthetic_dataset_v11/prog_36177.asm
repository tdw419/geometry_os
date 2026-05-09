; DESCRIPTION: Composite: . Then Places a white 77x40 rectangle at position (71, 16). Then Sets a single red pixel at (80, 13).
; PLAN: r0=71(x), r1=16(y), r2=77(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=80(x), r1=13(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a white 77x40 rectangle at position (71, 16).
; PLAN: r0=71(x), r1=16(y), r2=77(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 16
LDI r2, 77
LDI r3, 40
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single red pixel at (80, 13).
; PLAN: r0=80(x), r1=13(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 80
LDI r1, 13
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
