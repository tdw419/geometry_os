; DESCRIPTION: Places a red 55x118 rectangle at position (275, 125).
; PLAN: r0=275(x), r1=125(y), r2=55(width), r3=118(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 125
LDI r2, 55
LDI r3, 118
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
