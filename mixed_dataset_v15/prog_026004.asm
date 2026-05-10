; DESCRIPTION: Places a red 87x46 rectangle at position (0, 48).
; PLAN: r0=0(x), r1=48(y), r2=87(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 48
LDI r2, 87
LDI r3, 46
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
