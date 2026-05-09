; DESCRIPTION: Places a cyan 14x69 rectangle at position (8, 91).
; PLAN: r0=8(x), r1=91(y), r2=14(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 91
LDI r2, 14
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
