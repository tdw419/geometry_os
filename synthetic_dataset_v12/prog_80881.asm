; DESCRIPTION: Composite: Places a red 56x41 rectangle at position (255, 215) then Sets a single magenta pixel at (330, 106).
; PLAN: r0=255(x), r1=215(y), r2=56(width), r3=41(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=330(x), r6=106(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 255
LDI r1, 215
LDI r2, 56
LDI r3, 41
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 330
LDI r6, 106
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
