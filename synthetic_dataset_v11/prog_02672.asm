; DESCRIPTION: Composite: . Then Places a yellow 91x75 rectangle at position (98, 60). Then Sets a single cyan pixel at (81, 246).
; PLAN: r0=98(x), r1=60(y), r2=91(width), r3=75(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=81(x), r1=246(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a yellow 91x75 rectangle at position (98, 60).
; PLAN: r0=98(x), r1=60(y), r2=91(width), r3=75(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 60
LDI r2, 91
LDI r3, 75
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single cyan pixel at (81, 246).
; PLAN: r0=81(x), r1=246(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 81
LDI r1, 246
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
