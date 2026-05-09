; DESCRIPTION: Places a green 52x20 rectangle at position (241, 37).
; PLAN: r0=241(x), r1=37(y), r2=52(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 37
LDI r2, 52
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
