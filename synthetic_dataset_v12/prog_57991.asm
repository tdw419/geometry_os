; DESCRIPTION: Composite: Places a cyan 99x62 rectangle at position (265, 125) then Sets a single magenta pixel at (419, 84).
; PLAN: r0=265(x), r1=125(y), r2=99(width), r3=62(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=419(x), r6=84(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 265
LDI r1, 125
LDI r2, 99
LDI r3, 62
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 419
LDI r6, 84
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
