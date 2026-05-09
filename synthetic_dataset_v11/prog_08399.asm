; DESCRIPTION: Places a cyan 24x66 rectangle at position (52, 135).
; PLAN: r0=52(x), r1=135(y), r2=24(width), r3=66(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 135
LDI r2, 24
LDI r3, 66
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
