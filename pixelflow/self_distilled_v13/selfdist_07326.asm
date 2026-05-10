; DESCRIPTION: Places a orange 96x65 box at position (57, 103).
; PLAN: r0=57(x), r1=103(y), r2=96(width), r3=65(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 103
LDI r2, 96
LDI r3, 65
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
