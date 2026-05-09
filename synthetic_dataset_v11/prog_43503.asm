; DESCRIPTION: Composite: . Then Places a red 97x59 rectangle at position (93, 16). Then Places a green dot at position (32, 33).
; PLAN: r0=93(x), r1=16(y), r2=97(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=32(x), r1=33(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a red 97x59 rectangle at position (93, 16).
; PLAN: r0=93(x), r1=16(y), r2=97(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 16
LDI r2, 97
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a green dot at position (32, 33).
; PLAN: r0=32(x), r1=33(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 32
LDI r1, 33
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
