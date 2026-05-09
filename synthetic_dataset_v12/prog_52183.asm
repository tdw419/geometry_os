; DESCRIPTION: Renders a cyan box of size 64x98 starting at (344, 97).
; PLAN: r0=344(x), r1=97(y), r2=64(width), r3=98(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 97
LDI r2, 64
LDI r3, 98
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
