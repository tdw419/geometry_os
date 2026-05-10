; DESCRIPTION: Places a cyan 43x72 box at position (204, 34).
; PLAN: r0=204(x), r1=34(y), r2=43(width), r3=72(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 34
LDI r2, 43
LDI r3, 72
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
