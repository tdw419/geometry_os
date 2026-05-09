; DESCRIPTION: Places a cyan 15x72 rectangle at position (180, 61).
; PLAN: r0=180(x), r1=61(y), r2=15(width), r3=72(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 61
LDI r2, 15
LDI r3, 72
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
