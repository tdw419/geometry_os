; DESCRIPTION: Places a red 54x90 rectangle at position (345, 76).
; PLAN: r0=345(x), r1=76(y), r2=54(width), r3=90(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 76
LDI r2, 54
LDI r3, 90
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
