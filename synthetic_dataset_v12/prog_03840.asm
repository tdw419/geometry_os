; DESCRIPTION: Places a cyan 76x40 rectangle at position (260, 170).
; PLAN: r0=260(x), r1=170(y), r2=76(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 170
LDI r2, 76
LDI r3, 40
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
