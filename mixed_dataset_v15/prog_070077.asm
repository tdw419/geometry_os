; DESCRIPTION: Places a black 103x57 rectangle at position (174, 98).
; PLAN: r0=174(x), r1=98(y), r2=103(width), r3=57(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 98
LDI r2, 103
LDI r3, 57
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
