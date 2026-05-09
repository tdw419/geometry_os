; DESCRIPTION: Composite: . Then Creates a magenta rectangular region at (125, 112) spanning 86 by 15 pixels. Then Places a green dot at position (145, 186).
; PLAN: r0=125(x), r1=112(y), r2=86(width), r3=15(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=145(x), r1=186(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a magenta rectangular region at (125, 112) spanning 86 by 15 pixels.
; PLAN: r0=125(x), r1=112(y), r2=86(width), r3=15(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 112
LDI r2, 86
LDI r3, 15
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a green dot at position (145, 186).
; PLAN: r0=145(x), r1=186(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 145
LDI r1, 186
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
