; DESCRIPTION: Places a orange 75x90 rectangle at position (72, 57).
; PLAN: r0=72(x), r1=57(y), r2=75(width), r3=90(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 57
LDI r2, 75
LDI r3, 90
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
