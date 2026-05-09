; DESCRIPTION: Places a black 91x42 rectangle at position (221, 57).
; PLAN: r0=221(x), r1=57(y), r2=91(width), r3=42(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 57
LDI r2, 91
LDI r3, 42
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
