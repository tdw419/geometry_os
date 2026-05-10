; DESCRIPTION: Places a cyan 83x34 box at position (394, 200).
; PLAN: r0=394(x), r1=200(y), r2=83(width), r3=34(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 200
LDI r2, 83
LDI r3, 34
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
