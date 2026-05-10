; DESCRIPTION: Places a yellow 60x86 box at position (205, 166).
; PLAN: r0=205(x), r1=166(y), r2=60(width), r3=86(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 166
LDI r2, 60
LDI r3, 86
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
