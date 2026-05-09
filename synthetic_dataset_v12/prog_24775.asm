; DESCRIPTION: Places a cyan 52x33 rectangle at position (223, 56).
; PLAN: r0=223(x), r1=56(y), r2=52(width), r3=33(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 56
LDI r2, 52
LDI r3, 33
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
