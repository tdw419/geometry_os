; DESCRIPTION: Composite: . Then Draws a purple circle centered at (140, 87) with radius 33. Then Places a blue 51x27 rectangle at position (97, 182).
; PLAN: r0=140(x), r1=87(y), r2=33(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=97(x), r1=182(y), r2=51(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a purple circle centered at (140, 87) with radius 33.
; PLAN: r0=140(x), r1=87(y), r2=33(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 87
LDI r2, 33
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a blue 51x27 rectangle at position (97, 182).
; PLAN: r0=97(x), r1=182(y), r2=51(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 182
LDI r2, 51
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
