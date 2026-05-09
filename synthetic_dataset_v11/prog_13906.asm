; DESCRIPTION: Places a black 61x106 rectangle at position (46, 27).
; PLAN: r0=46(x), r1=27(y), r2=61(width), r3=106(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 27
LDI r2, 61
LDI r3, 106
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
