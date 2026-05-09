; DESCRIPTION: Composite: . Then Draws a white rectangle at (120, 146) with width 107 and height 58. Then Places a magenta dot at position (85, 36).
; PLAN: r0=120(x), r1=146(y), r2=107(width), r3=58(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=85(x), r1=36(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a white rectangle at (120, 146) with width 107 and height 58.
; PLAN: r0=120(x), r1=146(y), r2=107(width), r3=58(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 146
LDI r2, 107
LDI r3, 58
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta dot at position (85, 36).
; PLAN: r0=85(x), r1=36(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 85
LDI r1, 36
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
