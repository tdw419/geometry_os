; DESCRIPTION: Renders a green box of size 86x87 starting at (131, 75).
; PLAN: r0=131(x), r1=75(y), r2=86(width), r3=87(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 75
LDI r2, 86
LDI r3, 87
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
