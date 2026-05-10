; DESCRIPTION: Places a magenta 18x77 rectangle at position (281, 163).
; PLAN: r0=281(x), r1=163(y), r2=18(width), r3=77(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 163
LDI r2, 18
LDI r3, 77
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
