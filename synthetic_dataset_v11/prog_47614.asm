; DESCRIPTION: Composite: . Then Places a magenta dot at position (143, 128). Then Places a black 84x66 rectangle at position (102, 54).
; PLAN: r0=143(x), r1=128(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=102(x), r1=54(y), r2=84(width), r3=66(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta dot at position (143, 128).
; PLAN: r0=143(x), r1=128(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 143
LDI r1, 128
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Places a black 84x66 rectangle at position (102, 54).
; PLAN: r0=102(x), r1=54(y), r2=84(width), r3=66(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 54
LDI r2, 84
LDI r3, 66
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
