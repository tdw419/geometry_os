; DESCRIPTION: Places a white 87x86 box at position (221, 167).
; PLAN: r0=221(x), r1=167(y), r2=87(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 167
LDI r2, 87
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
