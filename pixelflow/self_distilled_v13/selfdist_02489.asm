; DESCRIPTION: Places a cyan 59x109 box at position (56, 6).
; PLAN: r0=56(x), r1=6(y), r2=59(width), r3=109(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 6
LDI r2, 59
LDI r3, 109
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
