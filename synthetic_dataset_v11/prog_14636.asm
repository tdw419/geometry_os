; DESCRIPTION: Composite: . Then Places a red 62x97 rectangle at position (80, 148). Then Sets a single green pixel at (24, 146).
; PLAN: r0=80(x), r1=148(y), r2=62(width), r3=97(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=24(x), r1=146(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a red 62x97 rectangle at position (80, 148).
; PLAN: r0=80(x), r1=148(y), r2=62(width), r3=97(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 148
LDI r2, 62
LDI r3, 97
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single green pixel at (24, 146).
; PLAN: r0=24(x), r1=146(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 24
LDI r1, 146
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
