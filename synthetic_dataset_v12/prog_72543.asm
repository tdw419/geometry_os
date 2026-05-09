; DESCRIPTION: Places a cyan 112x34 rectangle at position (212, 56).
; PLAN: r0=212(x), r1=56(y), r2=112(width), r3=34(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 56
LDI r2, 112
LDI r3, 34
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
