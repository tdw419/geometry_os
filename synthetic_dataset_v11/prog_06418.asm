; DESCRIPTION: Composite: . Then Places a yellow 91x64 rectangle at position (34, 68). Then Places a purple dot at position (191, 57).
; PLAN: r0=34(x), r1=68(y), r2=91(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=191(x), r1=57(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a yellow 91x64 rectangle at position (34, 68).
; PLAN: r0=34(x), r1=68(y), r2=91(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 68
LDI r2, 91
LDI r3, 64
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple dot at position (191, 57).
; PLAN: r0=191(x), r1=57(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 191
LDI r1, 57
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
