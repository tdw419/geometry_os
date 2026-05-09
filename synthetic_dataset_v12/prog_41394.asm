; DESCRIPTION: Places a red 51x38 rectangle at position (207, 57).
; PLAN: r0=207(x), r1=57(y), r2=51(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 57
LDI r2, 51
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
