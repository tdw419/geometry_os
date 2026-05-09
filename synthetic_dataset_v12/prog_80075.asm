; DESCRIPTION: Places a red 59x119 rectangle at position (425, 134).
; PLAN: r0=425(x), r1=134(y), r2=59(width), r3=119(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 134
LDI r2, 59
LDI r3, 119
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
