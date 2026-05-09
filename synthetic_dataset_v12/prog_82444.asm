; DESCRIPTION: Places a cyan 80x85 rectangle at position (85, 51).
; PLAN: r0=85(x), r1=51(y), r2=80(width), r3=85(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 51
LDI r2, 80
LDI r3, 85
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
