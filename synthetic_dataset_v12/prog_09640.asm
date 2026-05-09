; DESCRIPTION: Places a yellow 120x92 rectangle at position (249, 56).
; PLAN: r0=249(x), r1=56(y), r2=120(width), r3=92(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 56
LDI r2, 120
LDI r3, 92
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
