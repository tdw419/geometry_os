; DESCRIPTION: Places a red 15x15 rectangle at position (135, 135).
; PLAN: r0=135(x), r1=135(y), r2=15(width), r3=15(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 135
LDI r2, 15
LDI r3, 15
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
