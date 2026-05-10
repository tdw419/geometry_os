; DESCRIPTION: Places a cyan 88x112 rectangle at position (408, 10).
; PLAN: r0=408(x), r1=10(y), r2=88(width), r3=112(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 10
LDI r2, 88
LDI r3, 112
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
