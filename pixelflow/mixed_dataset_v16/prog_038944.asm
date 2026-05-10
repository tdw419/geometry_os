; DESCRIPTION: Composite: Places a blue 56x89 rectangle at position (53, 70) then Sets a single white pixel at (480, 5).
; PLAN: r0=53(x), r1=70(y), r2=56(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=480(x), r6=5(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 53
LDI r1, 70
LDI r2, 56
LDI r3, 89
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 480
LDI r6, 5
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
