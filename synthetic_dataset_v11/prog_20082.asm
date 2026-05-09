; DESCRIPTION: Places a cyan 54x60 rectangle at position (150, 75).
; PLAN: r0=150(x), r1=75(y), r2=54(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 75
LDI r2, 54
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
