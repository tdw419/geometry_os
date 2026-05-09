; DESCRIPTION: Places a black 98x69 rectangle at position (64, 146).
; PLAN: r0=64(x), r1=146(y), r2=98(width), r3=69(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 146
LDI r2, 98
LDI r3, 69
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
