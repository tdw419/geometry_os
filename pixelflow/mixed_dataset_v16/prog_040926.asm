; DESCRIPTION: Places a cyan 65x46 box at position (269, 185).
; PLAN: r0=269(x), r1=185(y), r2=65(width), r3=46(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 185
LDI r2, 65
LDI r3, 46
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
