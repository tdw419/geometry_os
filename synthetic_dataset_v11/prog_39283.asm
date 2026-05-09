; DESCRIPTION: Places a red 57x109 rectangle at position (15, 21).
; PLAN: r0=15(x), r1=21(y), r2=57(width), r3=109(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 21
LDI r2, 57
LDI r3, 109
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
