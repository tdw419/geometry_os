; DESCRIPTION: Composite: . Then Places a white dot at position (180, 206). Then Places a yellow 105x96 rectangle at position (18, 102).
; PLAN: r0=180(x), r1=206(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=18(x), r1=102(y), r2=105(width), r3=96(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white dot at position (180, 206).
; PLAN: r0=180(x), r1=206(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 180
LDI r1, 206
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Places a yellow 105x96 rectangle at position (18, 102).
; PLAN: r0=18(x), r1=102(y), r2=105(width), r3=96(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 102
LDI r2, 105
LDI r3, 96
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
