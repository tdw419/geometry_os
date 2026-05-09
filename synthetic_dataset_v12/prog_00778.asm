; DESCRIPTION: Places a cyan 78x120 rectangle at position (10, 132).
; PLAN: r0=10(x), r1=132(y), r2=78(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 132
LDI r2, 78
LDI r3, 120
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
