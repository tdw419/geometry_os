; DESCRIPTION: Places a cyan 54x85 rectangle at position (107, 30).
; PLAN: r0=107(x), r1=30(y), r2=54(width), r3=85(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 30
LDI r2, 54
LDI r3, 85
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
