; DESCRIPTION: Places a cyan 75x18 rectangle at position (85, 180).
; PLAN: r0=85(x), r1=180(y), r2=75(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 180
LDI r2, 75
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
