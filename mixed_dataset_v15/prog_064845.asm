; DESCRIPTION: Places a cyan 11x98 rectangle at position (386, 9).
; PLAN: r0=386(x), r1=9(y), r2=11(width), r3=98(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 9
LDI r2, 11
LDI r3, 98
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
