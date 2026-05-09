; DESCRIPTION: Composite: . Then Places a blue dot at position (70, 4). Then Places a white 28x11 rectangle at position (53, 50).
; PLAN: r0=70(x), r1=4(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=53(x), r1=50(y), r2=28(width), r3=11(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue dot at position (70, 4).
; PLAN: r0=70(x), r1=4(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 70
LDI r1, 4
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Places a white 28x11 rectangle at position (53, 50).
; PLAN: r0=53(x), r1=50(y), r2=28(width), r3=11(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 50
LDI r2, 28
LDI r3, 11
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
