; DESCRIPTION: Places a yellow 83x83 rectangle at position (80, 52).
; PLAN: r0=80(x), r1=52(y), r2=83(width), r3=83(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 52
LDI r2, 83
LDI r3, 83
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
