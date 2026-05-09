; DESCRIPTION: Places a cyan 25x120 rectangle at position (75, 75).
; PLAN: r0=75(x), r1=75(y), r2=25(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 75
LDI r2, 25
LDI r3, 120
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
