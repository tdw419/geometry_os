; DESCRIPTION: Places a red 40x61 rectangle at position (125, 92).
; PLAN: r0=125(x), r1=92(y), r2=40(width), r3=61(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 92
LDI r2, 40
LDI r3, 61
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
