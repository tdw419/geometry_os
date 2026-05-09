; DESCRIPTION: Places a red 120x37 rectangle at position (18, 19).
; PLAN: r0=18(x), r1=19(y), r2=120(width), r3=37(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 19
LDI r2, 120
LDI r3, 37
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
