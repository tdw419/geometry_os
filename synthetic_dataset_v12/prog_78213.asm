; DESCRIPTION: Places a red 90x82 rectangle at position (156, 80).
; PLAN: r0=156(x), r1=80(y), r2=90(width), r3=82(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 80
LDI r2, 90
LDI r3, 82
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
