; DESCRIPTION: Places a magenta 31x27 rectangle at position (408, 58).
; PLAN: r0=408(x), r1=58(y), r2=31(width), r3=27(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 58
LDI r2, 31
LDI r3, 27
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
