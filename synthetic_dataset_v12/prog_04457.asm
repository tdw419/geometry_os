; DESCRIPTION: Places a black 12x16 rectangle at position (286, 229).
; PLAN: r0=286(x), r1=229(y), r2=12(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 229
LDI r2, 12
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
