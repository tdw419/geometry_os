; DESCRIPTION: Places a magenta 43x52 rectangle at position (221, 200).
; PLAN: r0=221(x), r1=200(y), r2=43(width), r3=52(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 200
LDI r2, 43
LDI r3, 52
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
