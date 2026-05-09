; DESCRIPTION: Composite: . Then Places a cyan dot at position (160, 179). Then Draws a orange rectangle at (132, 71) with width 64 and height 120.
; PLAN: r0=160(x), r1=179(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=132(x), r1=71(y), r2=64(width), r3=120(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan dot at position (160, 179).
; PLAN: r0=160(x), r1=179(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 160
LDI r1, 179
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a orange rectangle at (132, 71) with width 64 and height 120.
; PLAN: r0=132(x), r1=71(y), r2=64(width), r3=120(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 71
LDI r2, 64
LDI r3, 120
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
