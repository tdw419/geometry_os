; DESCRIPTION: Places a cyan 22x100 rectangle at position (103, 106).
; PLAN: r0=103(x), r1=106(y), r2=22(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 106
LDI r2, 22
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
