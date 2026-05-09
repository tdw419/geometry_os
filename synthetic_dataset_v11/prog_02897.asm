; DESCRIPTION: Composite: . Then Places a blue dot at position (184, 30). Then Creates a orange rectangular region at (7, 149) spanning 64 by 96 pixels.
; PLAN: r0=184(x), r1=30(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=7(x), r1=149(y), r2=64(width), r3=96(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue dot at position (184, 30).
; PLAN: r0=184(x), r1=30(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 184
LDI r1, 30
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Creates a orange rectangular region at (7, 149) spanning 64 by 96 pixels.
; PLAN: r0=7(x), r1=149(y), r2=64(width), r3=96(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 149
LDI r2, 64
LDI r3, 96
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
