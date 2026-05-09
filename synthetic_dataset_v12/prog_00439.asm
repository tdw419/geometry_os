; DESCRIPTION: Places a magenta 52x86 rectangle at position (222, 156).
; PLAN: r0=222(x), r1=156(y), r2=52(width), r3=86(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 156
LDI r2, 52
LDI r3, 86
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
