; DESCRIPTION: Places a yellow 94x80 rectangle at position (95, 73).
; PLAN: r0=95(x), r1=73(y), r2=94(width), r3=80(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 73
LDI r2, 94
LDI r3, 80
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
