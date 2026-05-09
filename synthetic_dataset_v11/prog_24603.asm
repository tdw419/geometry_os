; DESCRIPTION: Places a cyan 56x75 rectangle at position (96, 164).
; PLAN: r0=96(x), r1=164(y), r2=56(width), r3=75(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 164
LDI r2, 56
LDI r3, 75
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
