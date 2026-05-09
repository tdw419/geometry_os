; DESCRIPTION: Places a red 91x16 rectangle at position (177, 219).
; PLAN: r0=177(x), r1=219(y), r2=91(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 219
LDI r2, 91
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
