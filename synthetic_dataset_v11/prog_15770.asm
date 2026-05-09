; DESCRIPTION: Places a red 39x40 rectangle at position (57, 61).
; PLAN: r0=57(x), r1=61(y), r2=39(width), r3=40(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 61
LDI r2, 39
LDI r3, 40
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
