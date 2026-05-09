; DESCRIPTION: Places a black 91x28 rectangle at position (102, 206).
; PLAN: r0=102(x), r1=206(y), r2=91(width), r3=28(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 206
LDI r2, 91
LDI r3, 28
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
