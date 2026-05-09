; DESCRIPTION: Places a cyan 115x16 rectangle at position (18, 223).
; PLAN: r0=18(x), r1=223(y), r2=115(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 223
LDI r2, 115
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
