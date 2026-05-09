; DESCRIPTION: Composite: . Then Places a purple dot at position (141, 138). Then Places a red 120x111 rectangle at position (128, 143).
; PLAN: r0=141(x), r1=138(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=128(x), r1=143(y), r2=120(width), r3=111(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple dot at position (141, 138).
; PLAN: r0=141(x), r1=138(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 141
LDI r1, 138
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Places a red 120x111 rectangle at position (128, 143).
; PLAN: r0=128(x), r1=143(y), r2=120(width), r3=111(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 143
LDI r2, 120
LDI r3, 111
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
