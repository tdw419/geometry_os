; DESCRIPTION: Places a white 66x63 rectangle at position (445, 90).
; PLAN: r0=445(x), r1=90(y), r2=66(width), r3=63(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 90
LDI r2, 66
LDI r3, 63
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
