; DESCRIPTION: Places a white 46x10 box at position (208, 64).
; PLAN: r0=208(x), r1=64(y), r2=46(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 64
LDI r2, 46
LDI r3, 10
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
