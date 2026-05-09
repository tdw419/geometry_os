; DESCRIPTION: Places a magenta 115x27 rectangle at position (272, 2).
; PLAN: r0=272(x), r1=2(y), r2=115(width), r3=27(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 2
LDI r2, 115
LDI r3, 27
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
