; DESCRIPTION: Places a cyan 76x70 rectangle at position (411, 137).
; PLAN: r0=411(x), r1=137(y), r2=76(width), r3=70(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 137
LDI r2, 76
LDI r3, 70
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
