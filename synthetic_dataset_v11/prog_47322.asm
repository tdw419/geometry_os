; DESCRIPTION: Places a magenta 18x47 rectangle at position (113, 141).
; PLAN: r0=113(x), r1=141(y), r2=18(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 141
LDI r2, 18
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
