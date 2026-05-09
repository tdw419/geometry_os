; DESCRIPTION: Places a cyan 52x17 rectangle at position (174, 77).
; PLAN: r0=174(x), r1=77(y), r2=52(width), r3=17(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 77
LDI r2, 52
LDI r3, 17
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
