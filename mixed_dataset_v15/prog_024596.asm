; DESCRIPTION: Places a white 50x24 box at position (115, 128).
; PLAN: r0=115(x), r1=128(y), r2=50(width), r3=24(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 128
LDI r2, 50
LDI r3, 24
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
