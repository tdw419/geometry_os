; DESCRIPTION: Places a white 75x32 rectangle at position (208, 16).
; PLAN: r0=208(x), r1=16(y), r2=75(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 16
LDI r2, 75
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
