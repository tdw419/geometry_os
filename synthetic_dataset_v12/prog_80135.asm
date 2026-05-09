; DESCRIPTION: Places a green 120x36 rectangle at position (312, 6).
; PLAN: r0=312(x), r1=6(y), r2=120(width), r3=36(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 6
LDI r2, 120
LDI r3, 36
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
