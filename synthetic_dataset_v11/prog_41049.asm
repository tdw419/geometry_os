; DESCRIPTION: Places a cyan 16x85 rectangle at position (106, 28).
; PLAN: r0=106(x), r1=28(y), r2=16(width), r3=85(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 28
LDI r2, 16
LDI r3, 85
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
