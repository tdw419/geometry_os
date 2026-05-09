; DESCRIPTION: Composite: . Then Places a red dot at position (28, 241). Then Places a blue 12x35 rectangle at position (16, 127).
; PLAN: r0=28(x), r1=241(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=16(x), r1=127(y), r2=12(width), r3=35(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red dot at position (28, 241).
; PLAN: r0=28(x), r1=241(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 28
LDI r1, 241
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Places a blue 12x35 rectangle at position (16, 127).
; PLAN: r0=16(x), r1=127(y), r2=12(width), r3=35(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 127
LDI r2, 12
LDI r3, 35
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
