; DESCRIPTION: Places a cyan 105x20 rectangle at position (6, 29).
; PLAN: r0=6(x), r1=29(y), r2=105(width), r3=20(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 29
LDI r2, 105
LDI r3, 20
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
