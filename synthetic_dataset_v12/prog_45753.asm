; DESCRIPTION: Places a cyan 75x11 rectangle at position (115, 193).
; PLAN: r0=115(x), r1=193(y), r2=75(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 193
LDI r2, 75
LDI r3, 11
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
