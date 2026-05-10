; DESCRIPTION: Places a cyan 110x95 box at position (380, 27).
; PLAN: r0=380(x), r1=27(y), r2=110(width), r3=95(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 27
LDI r2, 110
LDI r3, 95
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
