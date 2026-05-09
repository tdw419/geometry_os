; DESCRIPTION: Places a magenta 35x77 rectangle at position (181, 177).
; PLAN: r0=181(x), r1=177(y), r2=35(width), r3=77(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 177
LDI r2, 35
LDI r3, 77
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
