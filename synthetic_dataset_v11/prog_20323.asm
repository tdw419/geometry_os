; DESCRIPTION: Composite: . Then Places a magenta dot at position (51, 1). Then Places a purple 51x102 rectangle at position (173, 63).
; PLAN: r0=51(x), r1=1(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=173(x), r1=63(y), r2=51(width), r3=102(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta dot at position (51, 1).
; PLAN: r0=51(x), r1=1(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 51
LDI r1, 1
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Places a purple 51x102 rectangle at position (173, 63).
; PLAN: r0=173(x), r1=63(y), r2=51(width), r3=102(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 63
LDI r2, 51
LDI r3, 102
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
