; DESCRIPTION: Places a yellow 52x25 rectangle at position (208, 61).
; PLAN: r0=208(x), r1=61(y), r2=52(width), r3=25(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 61
LDI r2, 52
LDI r3, 25
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
