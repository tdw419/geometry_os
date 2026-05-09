; DESCRIPTION: Places a magenta 26x61 rectangle at position (36, 91).
; PLAN: r0=36(x), r1=91(y), r2=26(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 91
LDI r2, 26
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
