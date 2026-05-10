; DESCRIPTION: Places a cyan 25x87 rectangle at position (425, 36).
; PLAN: r0=425(x), r1=36(y), r2=25(width), r3=87(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 36
LDI r2, 25
LDI r3, 87
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
