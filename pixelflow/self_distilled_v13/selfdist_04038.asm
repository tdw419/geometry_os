; DESCRIPTION: Places a white 50x32 box at position (324, 4).
; PLAN: r0=324(x), r1=4(y), r2=50(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 4
LDI r2, 50
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
