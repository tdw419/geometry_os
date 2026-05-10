; DESCRIPTION: Composite: Places a cyan 119x113 rectangle at position (383, 72) then Sets a single magenta pixel at (27, 127).
; PLAN: r0=383(x), r1=72(y), r2=119(width), r3=113(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=27(x), r6=127(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 383
LDI r1, 72
LDI r2, 119
LDI r3, 113
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 27
LDI r6, 127
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
