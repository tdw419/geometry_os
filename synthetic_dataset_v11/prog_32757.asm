; DESCRIPTION: Places a cyan 83x119 rectangle at position (46, 96).
; PLAN: r0=46(x), r1=96(y), r2=83(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 96
LDI r2, 83
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
