; DESCRIPTION: Places a red 47x72 rectangle at position (236, 125).
; PLAN: r0=236(x), r1=125(y), r2=47(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 125
LDI r2, 47
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
