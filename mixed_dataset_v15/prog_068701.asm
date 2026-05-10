; DESCRIPTION: Places a cyan 13x14 box at position (350, 16).
; PLAN: r0=350(x), r1=16(y), r2=13(width), r3=14(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 16
LDI r2, 13
LDI r3, 14
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
