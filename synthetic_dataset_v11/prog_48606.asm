; DESCRIPTION: Places a magenta 21x77 rectangle at position (121, 45).
; PLAN: r0=121(x), r1=45(y), r2=21(width), r3=77(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 45
LDI r2, 21
LDI r3, 77
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
