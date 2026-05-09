; DESCRIPTION: Places a magenta 73x76 rectangle at position (260, 126).
; PLAN: r0=260(x), r1=126(y), r2=73(width), r3=76(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 126
LDI r2, 73
LDI r3, 76
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
