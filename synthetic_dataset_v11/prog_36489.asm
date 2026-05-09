; DESCRIPTION: Composite: . Then Creates a cyan rectangular region at (73, 66) spanning 63 by 61 pixels. Then Places a blue dot at position (51, 229).
; PLAN: r0=73(x), r1=66(y), r2=63(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=51(x), r1=229(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a cyan rectangular region at (73, 66) spanning 63 by 61 pixels.
; PLAN: r0=73(x), r1=66(y), r2=63(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 66
LDI r2, 63
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a blue dot at position (51, 229).
; PLAN: r0=51(x), r1=229(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 51
LDI r1, 229
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
