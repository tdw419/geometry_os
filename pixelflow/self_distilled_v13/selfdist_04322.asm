; DESCRIPTION: Places a cyan 66x25 box at position (153, 59).
; PLAN: r0=153(x), r1=59(y), r2=66(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 59
LDI r2, 66
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
