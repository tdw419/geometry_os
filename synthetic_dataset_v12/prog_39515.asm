; DESCRIPTION: Places a magenta 36x101 rectangle at position (398, 52).
; PLAN: r0=398(x), r1=52(y), r2=36(width), r3=101(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 52
LDI r2, 36
LDI r3, 101
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
