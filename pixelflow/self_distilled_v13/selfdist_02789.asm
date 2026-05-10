; DESCRIPTION: Places a yellow 77x18 box at position (328, 177).
; PLAN: r0=328(x), r1=177(y), r2=77(width), r3=18(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 177
LDI r2, 77
LDI r3, 18
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
