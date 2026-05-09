; DESCRIPTION: Places a black 31x54 rectangle at position (95, 125).
; PLAN: r0=95(x), r1=125(y), r2=31(width), r3=54(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 125
LDI r2, 31
LDI r3, 54
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
