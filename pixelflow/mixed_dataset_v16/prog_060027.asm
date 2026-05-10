; DESCRIPTION: Places a cyan 11x52 rectangle at position (382, 20).
; PLAN: r0=382(x), r1=20(y), r2=11(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 20
LDI r2, 11
LDI r3, 52
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
