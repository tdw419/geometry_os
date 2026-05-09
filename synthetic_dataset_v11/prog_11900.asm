; DESCRIPTION: Composite: . Then Places a magenta dot at position (209, 200). Then Places a white 95x64 rectangle at position (83, 81).
; PLAN: r0=209(x), r1=200(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=83(x), r1=81(y), r2=95(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta dot at position (209, 200).
; PLAN: r0=209(x), r1=200(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 209
LDI r1, 200
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Places a white 95x64 rectangle at position (83, 81).
; PLAN: r0=83(x), r1=81(y), r2=95(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 81
LDI r2, 95
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
