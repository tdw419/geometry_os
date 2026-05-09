; DESCRIPTION: Places a orange 98x29 rectangle at position (156, 135).
; PLAN: r0=156(x), r1=135(y), r2=98(width), r3=29(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 135
LDI r2, 98
LDI r3, 29
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
