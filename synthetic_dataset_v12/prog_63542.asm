; DESCRIPTION: Places a black 57x91 rectangle at position (106, 36).
; PLAN: r0=106(x), r1=36(y), r2=57(width), r3=91(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 36
LDI r2, 57
LDI r3, 91
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
