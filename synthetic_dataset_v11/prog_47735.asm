; DESCRIPTION: Composite: . Then Places a blue dot at position (234, 243). Then Renders a white box of size 104x120 starting at (39, 107).
; PLAN: r0=234(x), r1=243(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=39(x), r1=107(y), r2=104(width), r3=120(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue dot at position (234, 243).
; PLAN: r0=234(x), r1=243(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 234
LDI r1, 243
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Renders a white box of size 104x120 starting at (39, 107).
; PLAN: r0=39(x), r1=107(y), r2=104(width), r3=120(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 107
LDI r2, 104
LDI r3, 120
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
