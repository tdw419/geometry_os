; DESCRIPTION: Places a cyan 110x44 box at position (46, 130).
; PLAN: r0=46(x), r1=130(y), r2=110(width), r3=44(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 130
LDI r2, 110
LDI r3, 44
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
