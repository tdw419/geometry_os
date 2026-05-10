; DESCRIPTION: Places a cyan 71x77 box at position (154, 34).
; PLAN: r0=154(x), r1=34(y), r2=71(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 34
LDI r2, 71
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
