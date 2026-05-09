; DESCRIPTION: Places a cyan 112x77 rectangle at position (170, 126).
; PLAN: r0=170(x), r1=126(y), r2=112(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 126
LDI r2, 112
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
