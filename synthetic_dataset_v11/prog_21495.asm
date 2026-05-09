; DESCRIPTION: Places a white 22x100 rectangle at position (3, 126).
; PLAN: r0=3(x), r1=126(y), r2=22(width), r3=100(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 126
LDI r2, 22
LDI r3, 100
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
