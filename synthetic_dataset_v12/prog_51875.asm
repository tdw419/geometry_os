; DESCRIPTION: Places a red 68x98 rectangle at position (361, 125).
; PLAN: r0=361(x), r1=125(y), r2=68(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 125
LDI r2, 68
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
