; DESCRIPTION: Composite: . Then Places a cyan dot at position (80, 24). Then Places a red 93x60 rectangle at position (54, 84).
; PLAN: r0=80(x), r1=24(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=54(x), r1=84(y), r2=93(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan dot at position (80, 24).
; PLAN: r0=80(x), r1=24(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 80
LDI r1, 24
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Places a red 93x60 rectangle at position (54, 84).
; PLAN: r0=54(x), r1=84(y), r2=93(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 84
LDI r2, 93
LDI r3, 60
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
