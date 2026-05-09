; DESCRIPTION: Places a magenta 91x86 rectangle at position (89, 43).
; PLAN: r0=89(x), r1=43(y), r2=91(width), r3=86(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 43
LDI r2, 91
LDI r3, 86
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
