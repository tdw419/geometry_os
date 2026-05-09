; DESCRIPTION: Places a red 29x57 rectangle at position (223, 125).
; PLAN: r0=223(x), r1=125(y), r2=29(width), r3=57(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 125
LDI r2, 29
LDI r3, 57
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
