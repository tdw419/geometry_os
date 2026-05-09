; DESCRIPTION: Places a black 27x115 rectangle at position (330, 112).
; PLAN: r0=330(x), r1=112(y), r2=27(width), r3=115(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 112
LDI r2, 27
LDI r3, 115
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
