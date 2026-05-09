; DESCRIPTION: Places a cyan 12x96 rectangle at position (106, 63).
; PLAN: r0=106(x), r1=63(y), r2=12(width), r3=96(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 63
LDI r2, 12
LDI r3, 96
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
