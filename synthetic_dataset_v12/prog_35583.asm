; DESCRIPTION: Places a cyan 77x33 rectangle at position (42, 84).
; PLAN: r0=42(x), r1=84(y), r2=77(width), r3=33(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 84
LDI r2, 77
LDI r3, 33
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
