; DESCRIPTION: Places a magenta 23x86 rectangle at position (462, 9).
; PLAN: r0=462(x), r1=9(y), r2=23(width), r3=86(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 9
LDI r2, 23
LDI r3, 86
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
