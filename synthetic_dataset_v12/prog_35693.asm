; DESCRIPTION: Places a red 102x84 rectangle at position (156, 54).
; PLAN: r0=156(x), r1=54(y), r2=102(width), r3=84(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 54
LDI r2, 102
LDI r3, 84
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
