; DESCRIPTION: Places a cyan 29x16 box at position (386, 149).
; PLAN: r0=386(x), r1=149(y), r2=29(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 149
LDI r2, 29
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
