; DESCRIPTION: Places a cyan 39x95 box at position (331, 26).
; PLAN: r0=331(x), r1=26(y), r2=39(width), r3=95(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 26
LDI r2, 39
LDI r3, 95
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
