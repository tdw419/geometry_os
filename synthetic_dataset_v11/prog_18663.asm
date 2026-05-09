; DESCRIPTION: Composite: . Then Draws a blue rectangle at (133, 225) with width 64 and height 15. Then Places a white dot at position (255, 186).
; PLAN: r0=133(x), r1=225(y), r2=64(width), r3=15(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=255(x), r1=186(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a blue rectangle at (133, 225) with width 64 and height 15.
; PLAN: r0=133(x), r1=225(y), r2=64(width), r3=15(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 225
LDI r2, 64
LDI r3, 15
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a white dot at position (255, 186).
; PLAN: r0=255(x), r1=186(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 255
LDI r1, 186
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
