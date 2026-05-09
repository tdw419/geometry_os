; DESCRIPTION: Places a yellow 52x46 rectangle at position (182, 89).
; PLAN: r0=182(x), r1=89(y), r2=52(width), r3=46(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 89
LDI r2, 52
LDI r3, 46
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
