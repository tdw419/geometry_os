; DESCRIPTION: Places a black 98x112 rectangle at position (146, 40).
; PLAN: r0=146(x), r1=40(y), r2=98(width), r3=112(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 40
LDI r2, 98
LDI r3, 112
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
