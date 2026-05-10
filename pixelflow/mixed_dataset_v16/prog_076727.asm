; DESCRIPTION: Places a cyan 32x31 rectangle at position (223, 95).
; PLAN: r0=223(x), r1=95(y), r2=32(width), r3=31(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 95
LDI r2, 32
LDI r3, 31
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
