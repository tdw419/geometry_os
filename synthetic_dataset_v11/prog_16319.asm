; DESCRIPTION: Composite: . Then Places a yellow 30x10 rectangle at position (76, 29). Then Places a magenta dot at position (29, 76).
; PLAN: r0=76(x), r1=29(y), r2=30(width), r3=10(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=29(x), r1=76(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a yellow 30x10 rectangle at position (76, 29).
; PLAN: r0=76(x), r1=29(y), r2=30(width), r3=10(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 29
LDI r2, 30
LDI r3, 10
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta dot at position (29, 76).
; PLAN: r0=29(x), r1=76(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 29
LDI r1, 76
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
