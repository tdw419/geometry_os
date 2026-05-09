; DESCRIPTION: Composite: . Then Places a cyan 107x22 rectangle at position (91, 214). Then Draws a cyan circle centered at (63, 94) with radius 51.
; PLAN: r0=91(x), r1=214(y), r2=107(width), r3=22(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=63(x), r1=94(y), r2=51(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a cyan 107x22 rectangle at position (91, 214).
; PLAN: r0=91(x), r1=214(y), r2=107(width), r3=22(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 214
LDI r2, 107
LDI r3, 22
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a cyan circle centered at (63, 94) with radius 51.
; PLAN: r0=63(x), r1=94(y), r2=51(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 63
LDI r1, 94
LDI r2, 51
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
