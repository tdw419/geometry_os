; DESCRIPTION: Places a cyan 44x31 rectangle at position (127, 5).
; PLAN: r0=127(x), r1=5(y), r2=44(width), r3=31(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 5
LDI r2, 44
LDI r3, 31
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
