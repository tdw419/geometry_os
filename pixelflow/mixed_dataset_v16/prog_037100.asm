; DESCRIPTION: Places a cyan 49x28 box at position (203, 92).
; PLAN: r0=203(x), r1=92(y), r2=49(width), r3=28(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 92
LDI r2, 49
LDI r3, 28
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
