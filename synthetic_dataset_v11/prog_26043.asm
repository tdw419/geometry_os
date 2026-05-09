; DESCRIPTION: Composite: . Then Creates a green rectangular region at (180, 111) spanning 15 by 25 pixels. Then Places a magenta dot at position (107, 73).
; PLAN: r0=180(x), r1=111(y), r2=15(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=107(x), r1=73(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a green rectangular region at (180, 111) spanning 15 by 25 pixels.
; PLAN: r0=180(x), r1=111(y), r2=15(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 111
LDI r2, 15
LDI r3, 25
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta dot at position (107, 73).
; PLAN: r0=107(x), r1=73(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 107
LDI r1, 73
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
