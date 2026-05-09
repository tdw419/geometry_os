; DESCRIPTION: Composite: . Then Places a blue 71x108 rectangle at position (59, 65). Then Places a red dot at position (151, 71).
; PLAN: r0=59(x), r1=65(y), r2=71(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=151(x), r1=71(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a blue 71x108 rectangle at position (59, 65).
; PLAN: r0=59(x), r1=65(y), r2=71(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 65
LDI r2, 71
LDI r3, 108
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a red dot at position (151, 71).
; PLAN: r0=151(x), r1=71(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 151
LDI r1, 71
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
