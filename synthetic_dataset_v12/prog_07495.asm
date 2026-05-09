; DESCRIPTION: Places a cyan 66x50 rectangle at position (9, 91).
; PLAN: r0=9(x), r1=91(y), r2=66(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 91
LDI r2, 66
LDI r3, 50
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
