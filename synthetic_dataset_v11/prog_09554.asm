; DESCRIPTION: Composite: . Then Places a white dot at position (5, 82). Then Draws a cyan rectangle at (96, 132) with width 96 and height 65.
; PLAN: r0=5(x), r1=82(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=96(x), r1=132(y), r2=96(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white dot at position (5, 82).
; PLAN: r0=5(x), r1=82(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 5
LDI r1, 82
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a cyan rectangle at (96, 132) with width 96 and height 65.
; PLAN: r0=96(x), r1=132(y), r2=96(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 132
LDI r2, 96
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
