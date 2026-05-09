; DESCRIPTION: Composite: . Then Draws a cyan circle centered at (217, 33) with radius 33. Then Places a blue 32x115 rectangle at position (44, 37).
; PLAN: r0=217(x), r1=33(y), r2=33(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=44(x), r1=37(y), r2=32(width), r3=115(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a cyan circle centered at (217, 33) with radius 33.
; PLAN: r0=217(x), r1=33(y), r2=33(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 33
LDI r2, 33
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a blue 32x115 rectangle at position (44, 37).
; PLAN: r0=44(x), r1=37(y), r2=32(width), r3=115(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 37
LDI r2, 32
LDI r3, 115
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
