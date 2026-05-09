; DESCRIPTION: Places a orange 36x80 rectangle at position (112, 144).
; PLAN: r0=112(x), r1=144(y), r2=36(width), r3=80(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 144
LDI r2, 36
LDI r3, 80
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
