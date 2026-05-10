; DESCRIPTION: Places a cyan 64x40 box at position (65, 71).
; PLAN: r0=65(x), r1=71(y), r2=64(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 71
LDI r2, 64
LDI r3, 40
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
