; DESCRIPTION: Places a black 91x31 rectangle at position (280, 196).
; PLAN: r0=280(x), r1=196(y), r2=91(width), r3=31(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 196
LDI r2, 91
LDI r3, 31
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
