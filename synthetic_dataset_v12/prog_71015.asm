; DESCRIPTION: Places a magenta 23x86 rectangle at position (73, 52).
; PLAN: r0=73(x), r1=52(y), r2=23(width), r3=86(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 52
LDI r2, 23
LDI r3, 86
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
