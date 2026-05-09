; DESCRIPTION: Places a white 10x69 rectangle at position (208, 57).
; PLAN: r0=208(x), r1=57(y), r2=10(width), r3=69(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 57
LDI r2, 10
LDI r3, 69
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
