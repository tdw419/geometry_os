; DESCRIPTION: Composite: . Then Places a magenta dot at position (133, 13). Then Creates a blue rectangular region at (85, 131) spanning 96 by 88 pixels.
; PLAN: r0=133(x), r1=13(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=85(x), r1=131(y), r2=96(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta dot at position (133, 13).
; PLAN: r0=133(x), r1=13(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 133
LDI r1, 13
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Creates a blue rectangular region at (85, 131) spanning 96 by 88 pixels.
; PLAN: r0=85(x), r1=131(y), r2=96(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 131
LDI r2, 96
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
