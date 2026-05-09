; DESCRIPTION: Places a green 90x15 rectangle at position (152, 156).
; PLAN: r0=152(x), r1=156(y), r2=90(width), r3=15(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 156
LDI r2, 90
LDI r3, 15
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
