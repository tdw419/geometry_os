; DESCRIPTION: Places a yellow 52x35 rectangle at position (80, 143).
; PLAN: r0=80(x), r1=143(y), r2=52(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 143
LDI r2, 52
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
