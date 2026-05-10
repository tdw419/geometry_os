; DESCRIPTION: Places a red 96x90 box at position (356, 108).
; PLAN: r0=356(x), r1=108(y), r2=96(width), r3=90(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 108
LDI r2, 96
LDI r3, 90
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
