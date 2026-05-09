; DESCRIPTION: Composite: . Then Places a blue 70x40 rectangle at position (151, 16). Then Places a magenta dot at position (140, 162).
; PLAN: r0=151(x), r1=16(y), r2=70(width), r3=40(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=140(x), r1=162(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a blue 70x40 rectangle at position (151, 16).
; PLAN: r0=151(x), r1=16(y), r2=70(width), r3=40(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 16
LDI r2, 70
LDI r3, 40
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta dot at position (140, 162).
; PLAN: r0=140(x), r1=162(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 140
LDI r1, 162
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
