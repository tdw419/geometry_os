; DESCRIPTION: Composite: . Then Sets a single white pixel at (81, 121). Then Places a green 81x97 rectangle at position (27, 9).
; PLAN: r0=81(x), r1=121(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=27(x), r1=9(y), r2=81(width), r3=97(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single white pixel at (81, 121).
; PLAN: r0=81(x), r1=121(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 81
LDI r1, 121
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Places a green 81x97 rectangle at position (27, 9).
; PLAN: r0=27(x), r1=9(y), r2=81(width), r3=97(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 9
LDI r2, 81
LDI r3, 97
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
