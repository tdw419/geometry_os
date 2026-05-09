; DESCRIPTION: Composite: . Then Draws a cyan rectangle at (153, 44) with width 21 and height 108. Then Places a blue dot at position (191, 124).
; PLAN: r0=153(x), r1=44(y), r2=21(width), r3=108(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=191(x), r1=124(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a cyan rectangle at (153, 44) with width 21 and height 108.
; PLAN: r0=153(x), r1=44(y), r2=21(width), r3=108(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 44
LDI r2, 21
LDI r3, 108
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a blue dot at position (191, 124).
; PLAN: r0=191(x), r1=124(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 191
LDI r1, 124
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
