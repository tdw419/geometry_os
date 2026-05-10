; DESCRIPTION: Places a red 38x23 box at position (151, 199).
; PLAN: r0=151(x), r1=199(y), r2=38(width), r3=23(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 199
LDI r2, 38
LDI r3, 23
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
