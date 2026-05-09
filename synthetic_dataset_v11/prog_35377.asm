; DESCRIPTION: Places a cyan 87x38 rectangle at position (91, 91).
; PLAN: r0=91(x), r1=91(y), r2=87(width), r3=38(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 91
LDI r2, 87
LDI r3, 38
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
