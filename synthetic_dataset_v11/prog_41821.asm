; DESCRIPTION: Places a magenta 27x63 rectangle at position (116, 119).
; PLAN: r0=116(x), r1=119(y), r2=27(width), r3=63(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 119
LDI r2, 27
LDI r3, 63
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
