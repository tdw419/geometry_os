; DESCRIPTION: Places a yellow 120x24 rectangle at position (249, 85).
; PLAN: r0=249(x), r1=85(y), r2=120(width), r3=24(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 85
LDI r2, 120
LDI r3, 24
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
