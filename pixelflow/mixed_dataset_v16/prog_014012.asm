; DESCRIPTION: Places a cyan 34x34 rectangle at position (260, 166).
; PLAN: r0=260(x), r1=166(y), r2=34(width), r3=34(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 166
LDI r2, 34
LDI r3, 34
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
