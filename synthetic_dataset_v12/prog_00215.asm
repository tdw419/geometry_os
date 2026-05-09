; DESCRIPTION: Places a magenta 33x73 rectangle at position (323, 28).
; PLAN: r0=323(x), r1=28(y), r2=33(width), r3=73(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 28
LDI r2, 33
LDI r3, 73
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
