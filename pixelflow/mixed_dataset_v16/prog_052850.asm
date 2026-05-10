; DESCRIPTION: Places a cyan 27x49 rectangle at position (408, 26).
; PLAN: r0=408(x), r1=26(y), r2=27(width), r3=49(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 26
LDI r2, 27
LDI r3, 49
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
