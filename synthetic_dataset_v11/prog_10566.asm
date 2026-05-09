; DESCRIPTION: Places a white 10x16 rectangle at position (5, 209).
; PLAN: r0=5(x), r1=209(y), r2=10(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 209
LDI r2, 10
LDI r3, 16
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
