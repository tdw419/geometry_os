; DESCRIPTION: Places a black 52x47 rectangle at position (302, 32).
; PLAN: r0=302(x), r1=32(y), r2=52(width), r3=47(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 32
LDI r2, 52
LDI r3, 47
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
