; DESCRIPTION: Places a yellow 86x45 rectangle at position (140, 11).
; PLAN: r0=140(x), r1=11(y), r2=86(width), r3=45(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 11
LDI r2, 86
LDI r3, 45
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
