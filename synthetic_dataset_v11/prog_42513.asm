; DESCRIPTION: Composite: . Then Places a cyan dot at position (203, 157). Then Draws a white rectangle at (156, 33) with width 58 and height 92.
; PLAN: r0=203(x), r1=157(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=156(x), r1=33(y), r2=58(width), r3=92(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan dot at position (203, 157).
; PLAN: r0=203(x), r1=157(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 203
LDI r1, 157
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a white rectangle at (156, 33) with width 58 and height 92.
; PLAN: r0=156(x), r1=33(y), r2=58(width), r3=92(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 33
LDI r2, 58
LDI r3, 92
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
